#!/usr/bin/env node
const { execFileSync } = require('child_process');
const fs = require('fs');
const os = require('os');
const path = require('path');
const crypto = require('crypto');

const PASS_CLI_ENV = {
  ...process.env,
  PROTON_PASS_KEY_PROVIDER: process.env.PROTON_PASS_KEY_PROVIDER || 'fs',
};

function isTurnComplete(notification) {
  return notification.type === 'agent-turn-complete';
}

function getLastMessage(notification) {
  const message = notification['last-assistant-message'];

  if (typeof message !== 'string' || message.trim().length === 0) {
    return 'Codex turn complete';
  }

  // Pushover rejects oversized messages.
  const MAX_PUSHOVER_MESSAGE = 1024;
  return message.length > MAX_PUSHOVER_MESSAGE
    ? `${message.slice(0, MAX_PUSHOVER_MESSAGE - 1)}…`
    : message;
}

function getThreadId(notification) {
  const threadId = notification['thread-id'] || notification.thread_id;
  return typeof threadId === 'string' && threadId.trim().length > 0
    ? threadId
    : null;
}

function resolveStateDbPath(codexHome) {
  try {
    const entries = fs.readdirSync(codexHome);
    const candidates = entries
      .map((name) => {
        const match = /^state_(\d+)\.sqlite$/.exec(name);
        return match
          ? { path: path.join(codexHome, name), version: Number(match[1]) }
          : null;
      })
      .filter((entry) => entry && Number.isFinite(entry.version))
      .sort((a, b) => b.version - a.version);

    return candidates.length > 0 ? candidates[0].path : null;
  } catch {
    return null;
  }
}

function readThreadMetadata(notification, codexHome) {
  const threadId = getThreadId(notification);
  if (!threadId) {
    return null;
  }

  const dbPath = resolveStateDbPath(codexHome);
  if (!dbPath) {
    return null;
  }

  // SQL literal escape for single quotes.
  const escapedThreadId = threadId.replace(/'/g, "''");
  const query = `SELECT source || char(31) || cwd FROM threads WHERE id='${escapedThreadId}' LIMIT 1;`;

  try {
    const row = execFileSync('sqlite3', [dbPath, query], {
      encoding: 'utf8',
      stdio: ['ignore', 'pipe', 'ignore'],
      timeout: 1000,
    }).trim();

    if (!row) {
      return null;
    }

    const [source = '', cwd = ''] = row.split('\x1f');
    return { source, cwd };
  } catch {
    return null;
  }
}

function getDirectoryNameFromPath(value) {
  if (typeof value !== 'string') {
    return null;
  }

  const trimmed = value.trim();
  if (!trimmed) {
    return null;
  }

  const baseName = path.basename(trimmed);
  if (!baseName || baseName === '/' || baseName === '.' || baseName === '..') {
    return null;
  }

  return baseName;
}

function getNotificationTitle(notification, threadMetadata) {
  const titleCandidate =
    getDirectoryNameFromPath(threadMetadata && threadMetadata.cwd) ||
    getDirectoryNameFromPath(notification.cwd) ||
    getDirectoryNameFromPath(notification['project-root']) ||
    getDirectoryNameFromPath(notification.project_root) ||
    getDirectoryNameFromPath(notification.projectRoot) ||
    getDirectoryNameFromPath(process.env.PWD) ||
    'Codex';

  const MAX_PUSHOVER_TITLE = 100;
  return titleCandidate.length > MAX_PUSHOVER_TITLE
    ? `${titleCandidate.slice(0, MAX_PUSHOVER_TITLE - 1)}…`
    : titleCandidate;
}

function main() {
  const codexHome = path.join(process.env.HOME || os.homedir(), '.codex');
  const logDir = path.join(codexHome, 'log');
  try {
    fs.mkdirSync(logDir, { recursive: true });
  } catch {}

  if (process.argv.length < 3) {
    try {
      fs.appendFileSync(
        path.join(logDir, 'notify-invocations.log'),
        `${new Date().toISOString()} type=missing-arg argc=${process.argv.length}\n`,
        { mode: 0o600 }
      );
    } catch {}
    return;
  }

  let notification;
  try {
    notification = JSON.parse(process.argv[2]);
  } catch {
    try {
      const first = String(process.argv[2] || '').replace(/\s+/g, ' ').slice(0, 120);
      fs.appendFileSync(
        path.join(logDir, 'notify-invocations.log'),
        `${new Date().toISOString()} type=parse-error argc=${process.argv.length} arg0=${JSON.stringify(first)}\n`,
        { mode: 0o600 }
      );
    } catch {}
    return;
  }
  try {
    fs.appendFileSync(
      path.join(logDir, 'notify-invocations.log'),
      `${new Date().toISOString()} type=${notification.type || 'unknown'}\n`,
      { mode: 0o600 }
    );
  } catch {}

  if (!isTurnComplete(notification)) {
    return;
  }

  const threadMetadata = readThreadMetadata(notification, codexHome);

  if (threadMetadata && threadMetadata.source.includes('"subagent"')) {
    try {
      const threadId = getThreadId(notification) || 'unknown';
      fs.appendFileSync(
        path.join(logDir, 'notify-invocations.log'),
        `${new Date().toISOString()} type=subagent-skip thread=${threadId}\n`,
        { mode: 0o600 }
      );
    } catch {}
    return;
  }

  const pushoverTokenValue =
    process.env.PUSHOVER_TOKEN_PASS_REF ||
    process.env.PUSHOVER_TOKEN_REF ||
    process.env.PUSHOVER_TOKEN ||
    'pass://CLI/pushover-codex/token';
  const pushoverUserValue =
    process.env.PUSHOVER_USER_PASS_REF ||
    process.env.PUSHOVER_USER_REF ||
    process.env.PUSHOVER_USER ||
    'pass://CLI/pushover-codex/user';
  if (!pushoverTokenValue || !pushoverUserValue) {
    return;
  }

  const message = getLastMessage(notification);
  const title = getNotificationTitle(notification, threadMetadata);
  const tmpEnvFile = path.join(os.tmpdir(), `pass-cli-notify-${crypto.randomUUID()}.env`);

  try {
    fs.writeFileSync(
      tmpEnvFile,
      `PUSHOVER_TOKEN=${pushoverTokenValue}\nPUSHOVER_USER=${pushoverUserValue}\n`,
      { mode: 0o600 }
    );

    execFileSync('pass-cli', [
      'run',
      '--env-file',
      tmpEnvFile,
      '--',
      'sh',
      '-c',
      'curl -sS --fail -o /dev/null --form-string "token=$PUSHOVER_TOKEN" --form-string "user=$PUSHOVER_USER" --form-string "title=$1" --form-string "message=$2" https://api.pushover.net/1/messages.json',
      'sh',
      title,
      message,
    ], {
      env: PASS_CLI_ENV,
      stdio: ['ignore', 'ignore', 'pipe'],
      timeout: 10000,
    });
  } catch (error) {
    try {
      fs.mkdirSync(logDir, { recursive: true });
      const logPath = path.join(logDir, 'notify-error.log');
      const stderr = error && error.stderr
        ? String(error.stderr).trim()
        : '';
      const line = `${new Date().toISOString()} notify_failed${stderr ? ` stderr=${stderr}` : ''}\n`;
      fs.appendFileSync(logPath, line, { mode: 0o600 });
    } catch {}
  } finally {
    try {
      fs.unlinkSync(tmpEnvFile);
    } catch {}
  }
}

main();
