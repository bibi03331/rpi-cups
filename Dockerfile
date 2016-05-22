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
                        whois

RUN apt-get install -y printer-driver-splix

VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631

ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
