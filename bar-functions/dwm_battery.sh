#!/bin/sh

# A dwm_bar function to read the battery level and status
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    CHARGE0=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS0=$(cat /sys/class/power_supply/BAT0/status)
    STATUSAC=$(cat /sys/class/power_supply/AC/online)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" || "$STATUS0" = "Charging" || "$STATUSAC" = "1"]; then
            printf "🔌 0: %s%% %s 1: %s%% %s" "$CHARGE0" "$STATUS0" "$CHARGE" "$STATUS"
    	else
            printf "🔋 0: %s%% %s 1: %s%% %s" "$CHARGE0" "$STATUS0" "$CHARGE" "$STATUS"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

