#!/usr/bin/env bash

xinput disable `xinput --list | egrep -o "Wacom HID 4940.+id=[0-9]+" | egrep -o "id=[0-9]+" | egrep -o "[0-9]+"`
