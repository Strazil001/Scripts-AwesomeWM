#!/bin/bash

# Variables

# Devices
LAPTOP-SPEAKERS="Family 17h/19h HD Audio Controller Analog Stereo"
BOSE-NC700-HEADPHONES="Bose NC 700 HP"

AMMOUNT=$(pactl list sinks short | awk 'END {print NR}')
DESCRIPTION=""
DOT=""
D="·"
BAR=""
TARGET=""

if [ $AMMOUNT -eq 1 ]; then
	TARGET=$(pactl list sinks | grep Sink | awk 'FNR == 1 {print substr($2, 2, length($2)1)}')
	echo $(pactl set-sink-volume ${TARGET} +5%)
elif [ $AMMOUNT -eq 2 ]; then
	TARGET=$(pactl list sinks | grep Sink | awk 'FNR == 2 {print substr($2, 2, length($2)1)}')
	echo $(pactl set-sink-volume ${TARGET} +5%)
elif [ $AMMOUNT -eq 3 ]; then
	TARGET=$(pactl list sinks | grep Sink | awk 'FNR == 3 {print substr($2, 2, length($2)1)}')
	echo $(pactl set-sink-volume ${TARGET} +5%)
else
	echo "Not Found."
fi
