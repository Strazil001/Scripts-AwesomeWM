#!/bin/bash

# Variables
TARGET=$(df -h | awk 'NR==6 {print $6}')
DIR=""

if [[ "$TARGET" == "/home" ]]; then
 DIR=$(df -h | awk 'NR==6 {print $4}')
 else
 DIR=$(df -h | awk 'NR==7 {print $4}')
fi

echo $DIR
