#!/usr/bin/env bash
set -u

xinput list --name-only | grep -i 'touchpad' | while IFS= read -r device; do
    echo "Configuring touchpad: $device"

    if xinput list-props "$device" | grep -q 'libinput Tapping Enabled'; then
        xinput set-prop "$device" "libinput Tapping Enabled" 0
        echo "  disabled libinput tap-to-click"
    fi

    if xinput list-props "$device" | grep -q 'Synaptics Tap Time'; then
        xinput set-prop "$device" "Synaptics Tap Time" 0
        echo "  disabled Synaptics tap time"
    fi
done

if command -v synclient >/dev/null 2>&1; then
    synclient MaxTapTime=0 MaxDoubleTapTime=0 SingleTapTimeout=0 2>/dev/null || true
fi
