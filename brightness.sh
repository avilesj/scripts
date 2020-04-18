#/bin/bash
PRIMARY_DISPLAY=$(xrandr --verbose | grep 'connected primary' | head -n 1 | awk '{ print $1 }')
ARG=$1
case $ARG in
	--increase)
		BRIGHTNESS=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ' | awk '{print (($1 + 0.2) > 1) ? 1 : ($1 + 0.2)}')
		xrandr --output $PRIMARY_DISPLAY --brightness $BRIGHTNESS
		;;
	--decrease)
		BRIGHTNESS=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ' | awk '{print (($1 - 0.2) < 0) ? 0 : ($1 - 0.2)}')
		xrandr --output $PRIMARY_DISPLAY --brightness $BRIGHTNESS
		;;
	*) cat <<EOF
Brightness script
Options:
	--increase	Increase brightness of main display by a rate of 0.2
	--decrease	Decrease brightness of main display by a rate of 0.2
	--help, -h      Print this documentation

EOF
exit 1
;;

		    esac
