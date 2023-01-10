#!/bin/bash

# Variables
TARGET="/sys/class/backlight/amdgpu_bl0"

CURRENT=$(cat ${TARGET}/actual_brightness)
((CURRENT=CURRENT/2,55))

echo "$CURRENT%"
