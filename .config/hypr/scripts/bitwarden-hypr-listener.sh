#!/bin/bash

handle() {
  case $1 in
    windowtitlev2*Extension*Bitwarden*)
      # Extract the address (the part between '>>' and ',')
      # $1 looks like: windowtitlev2>>555eb728e680,Extension: (Bitwarden...
      local addr_with_prefix="${1#*>>}"        # Remove everything up to '>>'
      local window_addr="${addr_with_prefix%%,*}" # Remove everything after the first ','
      echo "handing: " $1

      # # Dispatch the toggle using the specific window address
      hyprctl dispatch setfloating address:0x"$window_addr"
      ;;
  esac
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  handle "$line"
done
