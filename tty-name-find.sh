#!/bin/bash

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev | grep USB); do
  syspath="${sysdevpath%/dev}"
  devname="$(udevadm info -q name -p $syspath)"
  if [[ $devname =~ ^\t\t\y ]]; then
    eval `udevadm info -q property --export -p $syspath`
  fi
#    echo "/dev/$devname - $ID_SERIAL"
    echo "SUBSYSTEM=="tty", ATTRS{idVendor}=="$ID_VENDOR_ID", ATTRS{idProduct}=="$ID_MODEL_ID", ATTRS{serial}=="$(echo $ID_PATH | cut -d'-' -f2)", SYMLINK+="gps0""
done
