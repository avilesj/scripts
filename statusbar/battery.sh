#/bin/bash

COUNT=0
BATTERY_LEVELS=0

BATTERIES=$(cat /sys/class/power_supply/BAT?/capacity)
AC=$(cat /sys/class/power_supply/AC/online)

for i in $BATTERIES; do
	BATTERY_LEVELS=`expr $i + $BATTERY_LEVELS`
	COUNT=`expr $COUNT + 1`
done

AVERAGE_BATTERY_LEVEL=$(( $BATTERY_LEVELS / $COUNT ))
ICON="\uf242"
if (( AVERAGE_BATTERY_LEVEL >= 85 ))
then
	ICON="\uf240"	
elif (( AVERAGE_BATTERY_LEVEL > 50 && AVERAGE_BATTERY_LEVEL < 85 ))
then
	ICON="\uf241"	
elif (( AVERAGE_BATTERY_LEVEL > 35 && AVERAGE_BATTERY_LEVEL <= 50 ))
then
	ICON="\uf242"	
elif (( AVERAGE_BATTERY_LEVEL > 15 && AVERAGE_BATTERY_LEVEL <= 35 ))
then
	ICON="\uf243"	
else
	ICON="\uf244"	
fi 

if [ $AC -eq 1 ]; then
	ICON="\uf0e7"
fi
echo -e "$ICON $AVERAGE_BATTERY_LEVEL%"
