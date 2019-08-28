#!/bin/bash

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm
rm /tmp/.X0-lock &>/dev/null || true

modprobe v4l2_common
modprobe bcm2835-v4l2
killall /usr/lib/xorg/Xorg
xhost +
startx /usr/app/reflx-os --enable-logging :0
