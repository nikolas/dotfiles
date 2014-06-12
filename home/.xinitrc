pkill urxvtd

xsetroot -solid orange &
xrdb -merge ~/.Xresources

urxvtd &

evilwm -term urxvtc
