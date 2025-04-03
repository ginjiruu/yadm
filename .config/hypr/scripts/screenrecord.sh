#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 950 "Screen Recording Started" "<span color='#90a4f4' font='26px'><i><b></b></i></span>"

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --bframes max_b_frames -f $HOME/Videos/Screencasts/$dateTime.mp4 -g "$(slurp)"
