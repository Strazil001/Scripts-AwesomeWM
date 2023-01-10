# Variables
DOT=""
D="-"
BAR=""
TARGET=""
DIR="/sys/class/backlight/amdgpu_bl1"
CURRENT=0

if [[ -d $DIR ]]; then
	TARGET="/sys/class/backlight/amdgpu_bl1"
	MAX=$(cat ${TARGET}/max_brightness)
	CURRENT=$(cat ${TARGET}/actual_brightness)
else
	TARGET="/sys/class/backlight/amdgpu_bl0"
	MAX=$(cat ${TARGET}/max_brightness)
	CURRENT=$(cat ${TARGET}/actual_brightness)
fi

((CURRENT=CURRENT/2,55))
((CURRENT=CURRENT/10))
for ((i = 0; i < $CURRENT; i++)); do
	BAR+=$DOT
done
for ((i = $CURRENT; i < 10; i++)); do
	BAR+=$D
done
echo "$BAR"
