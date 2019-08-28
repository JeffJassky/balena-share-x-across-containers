#!/bin/bash

# SHARED MEMORY
umount /dev/shm && mount -t tmpfs shm /dev/shm

# X SERVER CONFIG
xhost +local:root
export DISPLAY=:0
rm -r /tmp/.X11-unix
rm /tmp/.X0-lock &>/dev/null || true

# HOST CONFIG
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts

# MODPROBES
modprobe bcm2835-v4l2
modprobe v4l2_common

# START X SERVER
if [ ! -c /dev/fb1 ] && [ "$TFT" = "1" ]; then
  modprobe fbtft_device name=pitft verbose=0 rotate=${TFT_ROTATE:-0} || true
  sleep 1
  mknod /dev/fb1 c $(cat /sys/class/graphics/fb1/dev | tr ':' ' ') || true
  FRAMEBUFFER=/dev/fb1 startx /usr/app/reflx-os --enable-logging
else
  startx /usr/app/reflx-os --enable-logging
fi
