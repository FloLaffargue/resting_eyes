#!/bin/bash
username=$(/usr/bin/whoami)
echo "`date`: Regarder au loin" >> /home/florian/notif.log
pid=$(pgrep -u $username dolphin)
dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//' )
#export DBUS_SESSION_BUS_ADDRESS=$dbus
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
echo /run/user/1000/bus > /home/florian/notif.log
/usr/bin/notify-send --urgency="LOW" "Resting eyes"
