#/bin/bash

COUNT=0
TEMPERATURE_SUM=0
TEMPERATURES=$(cat /sys/devices/virtual/thermal/thermal_zone?/temp)

for i in $TEMPERATURES; do
	TEMPERATURE_SUM=`expr $i + $TEMPERATURE_SUM`
	COUNT=`expr $COUNT + 1`
done

AVERAGE_TEMPERATURE=$(( $(( $TEMPERATURE_SUM / 1000 )) / $COUNT ))
ICON="\uf2c9"

echo -e "$ICON $AVERAGE_TEMPERATURE°C"
