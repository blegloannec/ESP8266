#!/bin/bash

ESPTOOL=~/Git-Zone/esptool/esptool.py
USBPORT=/dev/ttyUSB0
#FIRMWARE=upy_esp8266-20160827-v1.8.3-60-gfea7fe4.bin
FIRMWARE=nodemcu-master-15-modules-2016-09-02-14-40-52-float.bin
INIT=esp_init_data_default.bin
BAUD=230400

$ESPTOOL             \
    --port $USBPORT  \
    --baud $BAUD     \
    write_flash      \
    --flash_mode qio \
    --flash_size 32m \
    --flash_freq 40m \
    0x00000 $FIRMWARE
#    0x3fc000 $INIT
