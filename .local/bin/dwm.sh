#!/bin/bash
sxhkd &>/dev/null &disown
picom --experimental-backends &>/dev/null &disown
nitrogen --restore &> /dev/null &disown
slstatus &> /dev/null &disown
dunst & > /dev/null & disown
warp-cli set-mode warp+doh & >/dev/null 
