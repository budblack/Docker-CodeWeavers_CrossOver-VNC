#!/bin/sh

[ -z "${DISPLAY}" ] || /usr/bin/vncserver -kill ${DISPLAY}
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
sleep 3
/usr/bin/vncserver -geometry 1920x1080 -fg
