#!/usr/bin/env bash

### Helpers {

always="always"

action=($always $@)

# Check if current autostart action matches $1
is() { [[ " ${action[@]} " =~ " $1 " ]]; }
# Is process $1 running
is_running() { test $(pgrep -f `procname $@` | head -n1); }
procname() { echo $@ | base64 -w 0; }
start_process() { namedproc `procname $@` -- $@ & disown; }
stop_process() { rkill $(pgrep -f `procname $@`); }

match_event() {
	for event in $1; do
		is "$event" && break
	done
}

on() {
	local do_restart=false
	local triggers=$1; shift
	while [[ $# -gt 0 ]] ; do
		case "$1" in
			-R|--restart) do_restart=true; shift ;; # kill if an instance is already running
			*) break ;;
		esac
	done
	if match_event "$triggers"; then
		if is "dry"; then
			echo $@
		else
			$do_restart && stop_process "$@"
			is_running "$@" || start_process $@
		fi
	fi
}

# }


##### Autostart {{{

  # Status bar
  on "startup reload" ~/.config/polybar/launch.sh
  # on "$startup" i3status

  # Better key autorepeat rate
  on "startup reload" xset r rate 200 50

  # Set default cursor
  # on "startup" xsetroot -cursor_name left_ptr

  # Wallpaper
  on "startup reload" feh --bg-fill ~/.wall

  # Auto lock when idle
  on "startup wakeup reload" -R idlelock

  # Notification daemon
  on "startup reload" -R dunst -config ~/.config/dunst/dunstrc

  # Compositor
  on "startup reload" picom --config ~/.config/picom/picom.conf

  # Network manager applet
  on "startup" nm-applet

  # Bluetooth applet
  on "startup reload" blueman-applet

  # Enable media controls via bluetooth device
  on "startup wakeup reload" mpris-proxy

  # Automatic screen temperature and brightness
  # on "startup" redshift -c ~/.config/redshift/redshift.conf

  # Hotkey daemon
  on "startup reload" -R sxhkd -c ~/.config/sxhkd/sxhkdrc

  # clipboard history
  on "startup reload" copyq

# }}}
