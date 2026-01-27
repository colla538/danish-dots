#!/bin/bash

handle() {
  case $1 in
    monitorremoved*)
      # Move workspaces 1 through 10 to DP-1 manually
      for i in {1..10}
      do
        hyprctl dispatch moveworkspacetomonitor "$i" DP-1
      done
      
      # Force DP-1 to show workspace 1 and take focus
      hyprctl dispatch focusmonitor DP-1
      hyprctl dispatch workspace 1
      ;;
  esac
}

# Listen to the socket without the extra bloat
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
