#!/usr/bin/env bash

# for laptop
# xrandr --newmode $(cvt 1366 768 | grep Mode | sed -e 's/.*"/1366x768/')
# xrandr --addmode VBOX0 1366x768
# xrandr --output VBOX0 --mode 1366x768

if [ `uname` == "Linux" ]; then
    pkill urxvtd

    if [ -f "$HOME/Pictures/clone.png" ]; then
        feh --bg-tile Pictures/clone.png
    else
        xsetroot -solid orange
    fi

    if [ -f "$HOME/Pictures/Snapshot_024.png" ]; then
        feh --bg-tile Pictures/Snapshot_024.png
    fi

    if [ -f "$HOME/Pictures/classic-mac-os-tile-wallpapers-4.png" ]; then
        feh --bg-tile Pictures/classic-mac-os-tile-wallpapers-4.png
    fi

    xsetroot -cursor_name left_ptr
    xrdb -merge ~/.Xresources
    keyboard.sh
    touchpad.sh

    if hash numlockx; then
        numlockx
    fi
    urxvtd &

    #exec evilwm -term urxvtc
    if [ `hostname` == "maldive" ]; then
        exec icewm
    else
        exec xmonad
    fi
    #exec wmaker
fi
