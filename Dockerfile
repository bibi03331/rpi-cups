FROM resin/rpi-raspbian

MAINTAINER Sebastien LAPORTE
RUN apt-get update && \
    apt-get install -y  nano \
                        ca-certificates \
                        git \
                        openssl \
                        wget \
                        cups \
                        cups-pdf \
                        whois && \
    apt-get clean

# Disbale some cups backend that are unusable within a container
RUN mv /usr/lib/cups/backend/parallel /usr/lib/cups/backend-available/ &&\
    mv /usr/lib/cups/backend/serial /usr/lib/cups/backend-available/ &&\
    mv /usr/lib/cups/backend/usb /usr/lib/cups/backend-available/

# Allow web interface access
RUN sed -i 's/Listen localhost:631/Port 631/g' /etc/cups/cupsd.conf

VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
