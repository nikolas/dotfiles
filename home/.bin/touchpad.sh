#!/usr/bin/env bash

# Disable tap to click
synclient MaxTapTime=0 MaxDoubleTapTime=0 SingleTapTimeout=0
xinput set-prop 11 "Synaptics Tap Time" 0
