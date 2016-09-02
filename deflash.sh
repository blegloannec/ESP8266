#!/bin/bash

ESPTOOL=~/Git-Zone/esptool/esptool.py
USBPORT=/dev/ttyUSB0

$ESPTOOL --port $USBPORT erase_flash
