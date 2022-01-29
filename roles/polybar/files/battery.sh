#!/bin/sh

PATH_AC="/sys/class/power_supply/AC"
PATH_BATTERY="/sys/class/power_supply/BAT0"

ac=0
battery_percent=0
red=$(xrdb -query | grep color1: | awk '{print $2}')
green=$(xrdb -query | grep color2: | awk '{print $2}')
yellow=$(xrdb -query | grep color3: | awk '{print $2}')

if [ -f "$PATH_AC/online" ]; then
    ac=$(cat "$PATH_AC/online")
fi

if [ -f "$PATH_BATTERY/capacity" ]; then
    battery_percent=$(cat "$PATH_BATTERY/capacity")
fi


if [ "$1" = "percent" ]; then
    echo "$battery_percent%"
elif [ "$ac" -eq 1 ]; then
    icon="ﮣ"

    echo "$icon"
else
    if [ "$battery_percent" -gt 98 ]; then
        icon="%{F$green}%{F-}"
    elif [ "$battery_percent" -gt 90 ]; then
        icon="%{F$green}%{F-}"
    elif [ "$battery_percent" -gt 80 ]; then
        icon="%{F$green}%{F-}"
    elif [ "$battery_percent" -gt 70 ]; then
        icon="%{F$green}%{F-}"
    elif [ "$battery_percent" -gt 60 ]; then
        icon="%{F$yellow}%{F-}"
    elif [ "$battery_percent" -gt 50 ]; then
        icon="%{F$yellow}%{F-}"
    elif [ "$battery_percent" -gt 40 ]; then
        icon="%{F$yellow}%{F-}"
    elif [ "$battery_percent" -gt 30 ]; then
        icon="%{F$yellow}%{F-}"
    elif [ "$battery_percent" -gt 20 ]; then
        icon="%{F$red}%{F-}"
    else
        icon="%{F$red}%{F-}"
    fi

    echo "$icon"
fi
