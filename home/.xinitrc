#!/usr/bin/env bash

# for laptop
# xrandr --newmode $(cvt 1366 768 | grep Mode | sed -e 's/.*"/1366x768/')
# xrandr --addmode VBOX0 1366x768
# xrandr --output VBOX0 --mode 1366x768

if [ `uname` == "Linux" ]; then
    pkill urxvtd

    xsetroot -solid orange
    xsetroot -cursor_name left_ptr
    xrdb -merge ~/.Xresources

    numlockx
    urxvtd &

    #exec evilwm -term urxvtc
    exec xmonad
    #exec icewm
    #exec wmaker
fi
