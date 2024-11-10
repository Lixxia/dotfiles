#!/bin/sh

TOGGLE=/tmp/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    pactl set-default-sink alsa_output.usb-Generic_USB_Audio-00.analog-stereo
    notify-send -i /usr/share/icons/ubuntu-mono-dark/apps/22/rhythmbox-panel.svg "Desktop Speakers Enabled."
else
    rm $TOGGLE
    pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink
    notify-send -i /usr/share/icons/ubuntu-mono-dark/apps/22/rhythmbox-notplaying.svg "Desktop Speakers Disabled."
fi
