#!/usr/bin/env bash
set -uo pipefail

SDK=/home/wh3at/Android/Sdk
ADB=$SDK/platform-tools/adb
AVD=gymx86
DEV=emulator-5554
APP=com.fitness22.workout

if ! $ADB devices | grep -q "$DEV"; then
  echo "Androidエミュレータを起動しています（30秒ほど）..."
  nohup "$SDK/emulator/emulator" -avd "$AVD" -gpu host -memory 4096 -no-boot-anim -no-audio -no-metrics > /tmp/emulator.log 2>&1 &
  for _ in $(seq 1 60); do
    sleep 5
    if [ "$($ADB -s $DEV shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" = "1" ]; then
      break
    fi
  done
  if [ "$($ADB -s $DEV shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" != "1" ]; then
    echo "起動待ちがタイムアウトしました。ログ: /tmp/emulator.log" >&2
    exit 1
  fi
fi

echo "Gymverse を起動しています..."
$ADB -s $DEV shell am start -n "$APP/.feature.splash.GymSplashActivity" > /dev/null 2>&1
echo "完了"
