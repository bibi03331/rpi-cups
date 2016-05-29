#!/bin/bash
docker run -d \
  -p 631:631/tcp \
  -p 631:631/udp \
  --name=rpi-cups \
  -e CUPS_USER_ADMIN=admin \
  -e CUPS_USER_PASSWORD=dHAm4Chaj7aJEwu9hixA \
  -v /root/persistent/rpi-cups/cups:/etc/cups \
  -v /root/persistent/rpi-cups/logs:/var/log/cups \
  -v /root/persistent/rpi-cups/spool:/var/spool/cups \
  -v /root/persistent/rpi-cups/cache:/var/cache/cups \
  --privileged \
  rpi-cups-v1
