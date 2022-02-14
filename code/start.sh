#!/bin/sh
# Author: Madhu Akula
# Starts VNC server and novnc with websockify for browser access
vncserver -localhost yes -geometry 1024x768 -SecurityTypes None :0
websockify --web /usr/share/novnc/ 8080 localhost:5900
