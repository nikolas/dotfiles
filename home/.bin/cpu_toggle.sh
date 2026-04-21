#!/usr/bin/env bash

current=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [ "$current" = "performance" ]; then
    sudo cpupower frequency-set -g powersave
else
    sudo cpupower frequency-set -g performance
fi
