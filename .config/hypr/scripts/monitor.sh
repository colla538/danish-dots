#!/bin/bash

handle() {
  case $1 in
    monitorremoved*)
      # Wait for the hardware handshake to finish
      sleep 0.5
      
      # 1. Find all active workspaces (Greps IDs from 'hyprctl workspaces')
      ACTIVE_WS=$(hyprctl workspaces | grep "workspace ID" | awk '{print $3}')

      # 2. Loop through only the active ones and move them to eDP-1
      for ws in $ACTIVE_WS
      do
        hyprctl dispatch moveworkspacetomonitor "$ws" eDP-1 >/dev/null 2>&1
      done
      
      # 3. Focus the laptop and force view to Workspace 1
      hyprctl dispatch focusmonitor eDP-1
      hyprctl dispatch workspace 1
      ;;
  esac
}

# The Pipe: Connects Hyprland's events to our function
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
