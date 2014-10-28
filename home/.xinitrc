#!/usr/bin/env bash

pkill urxvtd

xsetroot -solid orange
xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources

urxvtd &

# for laptop
# xrandr --newmode $(cvt 1366 768 | grep Mode | sed -e 's/.*"/1366x768/')
# xrandr --addmode VBOX0 1366x768
# xrandr --output VBOX0 --mode 1366x768

#exec evilwm -term urxvtc
#exec xmonad
exec icewm
