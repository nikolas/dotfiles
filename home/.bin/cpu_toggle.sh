#!/usr/bin/env bash

current=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [ "$current" = "performance" ]; then
    echo "Setting powersave"
    sudo cpupower frequency-set -g powersave
else
    echo "Setting performance"
    sudo cpupower frequency-set -g performance
fi
