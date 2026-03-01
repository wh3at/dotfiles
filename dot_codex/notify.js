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

function main() {
  const logDir = path.join(process.env.HOME || os.homedir(), '.codex', 'log');
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
      'curl -sS --fail -o /dev/null --form-string "token=$PUSHOVER_TOKEN" --form-string "user=$PUSHOVER_USER" --form-string "title=Codex" --form-string "message=$1" https://api.pushover.net/1/messages.json',
      'sh',
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
