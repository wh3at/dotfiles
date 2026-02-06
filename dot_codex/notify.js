#!/usr/bin/env node
const { spawn } = require('child_process');

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

  const message = notification['last-assistant-message'] || 'Codex turn complete';

  const args = [
    '-sS',
    '--fail',
    '-o',
    '/dev/null',
    '--form-string',
    'token=ajsqinxvkig87mdjrcgmq7myi6nu8g',
    '--form-string',
    'user=uhsobvv2dtxv98mvhk853y2cssmman',
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
