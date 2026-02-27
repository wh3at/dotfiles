#!/usr/bin/env node
const { execFileSync, spawn } = require('child_process');
const fs = require('fs');
const os = require('os');
const path = require('path');
const crypto = require('crypto');

const PASS_CLI_ENV = {
  ...process.env,
  PROTON_PASS_KEY_PROVIDER: process.env.PROTON_PASS_KEY_PROVIDER || 'fs',
};

function readSecret(reference) {
  if (!reference) return null;

  if (!reference.startsWith('pass://')) {
    return null;
  }

  const tmpEnvFile = path.join(os.tmpdir(), `pass-cli-notify-${crypto.randomUUID()}.env`);

  try {
    fs.writeFileSync(tmpEnvFile, `__PASS_CLI_SECRET=${reference}\n`, { mode: 0o600 });
    const output = execFileSync(
      'pass-cli',
      ['run', '--env-file', tmpEnvFile, '--', 'sh', '-c', 'printf %s "$__PASS_CLI_SECRET"'],
      {
        encoding: 'utf8',
        env: PASS_CLI_ENV,
        stdio: ['ignore', 'pipe', 'ignore'],
        timeout: 3000,
      }
    );
    return output.trim() || null;
  } catch {
    return null;
  } finally {
    try {
      fs.unlinkSync(tmpEnvFile);
    } catch {}
  }
}

function main() {
  if (process.argv.length !== 3) {
    return;
  }

  let notification;
  try {
    notification = JSON.parse(process.argv[2]);
  } catch {
    return;
  }

  if (notification.type !== 'agent-turn-complete') {
    return;
  }

  const pushoverTokenRef = process.env.PUSHOVER_TOKEN_PASS_REF || process.env.PUSHOVER_TOKEN_REF;
  const pushoverUserRef = process.env.PUSHOVER_USER_PASS_REF || process.env.PUSHOVER_USER_REF;
  const pushoverToken = readSecret(pushoverTokenRef);
  const pushoverUser = readSecret(pushoverUserRef);
  if (!pushoverToken || !pushoverUser) {
    return;
  }

  const message = notification['last-assistant-message'] || 'Codex turn complete';

  const args = [
    '-sS',
    '--fail',
    '-o',
    '/dev/null',
    '--form-string',
    `token=${pushoverToken}`,
    '--form-string',
    `user=${pushoverUser}`,
    '--form-string',
    'title=Codex',
    '--form-string',
    `message=${message}`,
    'https://api.pushover.net/1/messages.json',
  ];

  // Fire-and-forget; no output on success.
  const curl = spawn('curl', args, { stdio: 'ignore' });
  curl.on('error', () => {});
}

main();
