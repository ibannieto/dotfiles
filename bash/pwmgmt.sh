#!/bin/bash
powertop --auto-tune
sudo systemctl stop openntpd ; sudo ntpd -f /etc/ntpd.conf
echo 'on' > '/sys/bus/usb/devices/1-2.1/power/control';
echo 'on' > '/sys/bus/usb/devices/1-2.4/power/control';
