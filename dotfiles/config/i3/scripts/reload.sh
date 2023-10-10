#!/usr/bin/env bash

i3-msg restart
~/.config/autostart.sh reload &
~/.config/polybar/launch.sh &
