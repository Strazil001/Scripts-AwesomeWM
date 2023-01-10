#!/bin/bash

# Variables
TARGET=""
DIR="/sys/class/backlight/amdgpu_bl1"

if [[ -d $DIR ]]; then
	TARGET="/sys/class/backlight/amdgpu_bl1"
	MAX=$(cat ${TARGET}/max_brightness)
	CURRENT=$(cat ${TARGET}/actual_brightness)
else
	TARGET="/sys/class/backlight/amdgpu_bl0"
	MAX=$(cat ${TARGET}/max_brightness)
	CURRENT=$(cat ${TARGET}/actual_brightness)
fi


if [[ $CURRENT -gt 0 ]]; then
	((CURRENT=CURRENT-10))
	echo $CURRENT > $TARGET/brightness
fi
