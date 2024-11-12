TITLE=$(aerospace list-windows --focused --format %{app-name})
if [ "$TITLE" = "" ]; then
    sketchybar --animate circ 15 --set title y_offset=70
    sleep 0.2 && sketchybar --set title label=""
else
    LABEL="$(echo $TITLE)"
    if [ "$(sketchybar --query title | jq -r '.label.value')" != "$LABEL" ]; then
        sketchybar --animate circ 15 --set title y_offset=70            \
                   --animate circ 10  --set title y_offset=7            \
                   --animate circ 15 --set title y_offset=0
        
        sleep 0.15 && sketchybar --set title label="$LABEL"
    fi
fi
