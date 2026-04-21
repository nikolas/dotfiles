#!/usr/bin/env bash

current=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [ "$current" = "performance" ]; then
    pkexec cpupower frequency-set -g powersave
else
    pkexec cpupower frequency-set -g performance
fi
