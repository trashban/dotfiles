#!/usr/bin/env sh

_temp=$(grep -Eo '^[0-9]{2}' /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input)

echo "temp ${_temp}°C"
