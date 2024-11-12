if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on icon.color=0xEB1e1e2e
else
    sketchybar --set $NAME background.drawing=off icon.color=0xFF575268
fi
