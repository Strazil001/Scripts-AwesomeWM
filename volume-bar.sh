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

# Functions

# Take in the target sink volume and output a volumebar
return-bar() {
	for ((i = 0; i < $1; i++)); do
		if [ $i -lt 10 ]; then
			BAR+=$DOT
		fi
	done
	for ((i = $1; i < 10; i++)); do
		BAR+=$D
	done
	echo "$BAR"
}

if [ $AMMOUNT -eq 1 ]; then
	TARGET=$(pactl list sinks | grep Volume | awk 'FNR == 1 {print substr($5, 1, length($5)-2)}')
	return-bar $TARGET
elif [ $AMMOUNT -eq 2 ]; then
	TARGET=$(pactl list sinks | grep Volume | awk 'FNR == 3 {print substr($5, 1, length($5)-2)}')
	return-bar $TARGET
elif [ $AMMOUNT -eq 3 ]; then
	TARGET=$(pactl list sinks | grep Volume | awk 'FNR == 5 {print substr($5, 1, length($5)-2)}')
	return-bar $TARGET
else
	echo "Not Found."
fi
