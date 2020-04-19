#!/bin/bash
DISPLAY_FILE="$HOME/.config/display "
touch $HOME/.config/display

DISPLAY_STATE=$(cat $DISPLAY_FILE)
XRANDR_COMMAND=""
NEW_DISPLAY_STATE=""


# Notifications
NOTIFICATION_DISPLAY_STATE=""
[ -z "$DISPLAY_STATE" ] && DISPLAY_STATE="MAIN"

case $DISPLAY_STATE in
    "MAIN")
        NEW_DISPLAY_STATE="EXTERNAL_LEFT"
        XRANDR_COMMAND="xrandr --output HDMI2 --auto --left-of eDP1"
        ;;
    "EXTERNAL_LEFT")
        NEW_DISPLAY_STATE="MAIN"
        XRANDR_COMMAND="xrandr --output HDMI2 --off"
        ;;

esac

case $NEW_DISPLAY_STATE in
    "MAIN")
        NOTIFICATION_DISPLAY_STATE="Main"
        ;;
    "EXTERNAL_LEFT")
        NOTIFICATION_DISPLAY_STATE="External display, to the left"
        ;;

esac

echo "$NEW_DISPLAY_STATE" > $DISPLAY_FILE

$XRANDR_COMMAND &&
notify-send -u critical "Display settings changed" "$NOTIFICATION_DISPLAY_STATE"




