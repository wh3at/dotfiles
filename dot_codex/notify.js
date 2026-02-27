#!/usr/bin/env node
const { execFileSync, spawn } = require('child_process');

function readSecret(reference) {
  if (!reference) return null;

  try {
    if (reference.startsWith('pass://')) {
      const output = execFileSync('pass-cli', ['show', reference], {
        encoding: 'utf8',
        stdio: ['ignore', 'pipe', 'ignore'],
        timeout: 3000,
      });
      return output.trim() || null;
    }
  } catch {
    return null;
  }

  return null;
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
