#!/bin/sh

ifconfig eth0 up
ifconfig eth0 192.168.1.117

echo "ismod btn_drv.ko"
cd /ko
insmod btn_drv.ko
insmod led_drv.ko
insmod wm_8960.ko

echo "start hotplug listen"
cd /var/shell
./hotplug.sh&

echo "start phidi mp4file"
/var/bin/phidi&
/var/bin/mp4file&

echo "done"

