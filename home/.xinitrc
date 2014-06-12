#!/usr/bin/env bash

pkill urxvtd

xsetroot -solid orange &
xrdb -merge ~/.Xresources &

urxvtd &

#exec evilwm -term urxvtc
exec fluxbox
