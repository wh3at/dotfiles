#!/usr/bin/env node
const { execFileSync, spawn } = require('child_process');

function readSecretFromOp(reference) {
  try {
    const output = execFileSync('op', ['read', reference], {
      encoding: 'utf8',
      stdio: ['ignore', 'pipe', 'ignore'],
      timeout: 3000,
    });
    return output.trim() || null;
  } catch {
    return null;
  }
}

function resolveSecret(directEnvName, opRefEnvName) {
  const directValue = process.env[directEnvName];
  if (directValue) {
    return directValue;
  }

  const opReference = process.env[opRefEnvName];
  if (!opReference) {
    return null;
  }

  return readSecretFromOp(opReference);
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

  const pushoverToken = resolveSecret('PUSHOVER_TOKEN', 'PUSHOVER_TOKEN_OP_REF');
  const pushoverUser = resolveSecret('PUSHOVER_USER', 'PUSHOVER_USER_OP_REF');
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
