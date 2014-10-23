#!/usr/bin/env bash

pkill urxvtd

xsetroot -solid orange
xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources

urxvtd &

#exec evilwm -term urxvtc
#exec xmonad
exec icewm
