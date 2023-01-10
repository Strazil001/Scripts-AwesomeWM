#!/bin/bash

# Variables
AMMOUNT=$(pactl list sinks short | awk 'END {print NR}')
TARGET=0

if [ $AMMOUNT -eq 1 ]; then
	TARGET=$(pactl list sinks | grep Volume | awk 'FNR == 1 {print substr($5, 1, length($5)-2)/10}')
elif [ $AMMOUNT -eq 2 ]; then
	TARGET=$(pactl list sinks | grep Volume | awk 'FNR == 3 {print substr($5, 1, length($5)-2)/10}')
else
	TARGET=NOT_FOUND
fi

echo $TARGET
