#!/bin/bash
docker run -d \
  -p 631:631 \
  --name=rpi-cups \
  -v /root/persistent/rpi-cups/cups:/etc/cups \
  -v /root/persistent/rpi-cups/logs:/var/log/cups \
  -v /root/persistent/rpi-cups/spool:/var/spool/cups \
  -v /root/persistent/rpi-cups/cache:/var/cache/cups \
  --privileged \
  rpi-cups-v1
