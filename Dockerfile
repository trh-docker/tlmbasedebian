FROM debian:stretch-slim

RUN mkdir /opt/certstrap

ADD https://zinc.tpnfc.us/TLM.crt /usr/local/share/ca-certificates/
ADD ./certstrap/tlmca /opt/certstrap/certstrap

RUN mkdir /opt/ssl/ /opt/ssl/certs &&\
    apt-get update && apt-get -y upgrade && apt-get install -y ca-certificates libncurses5 unzip &&\
    apt-get upgrade -y &&\
    update-ca-certificates --verbose &&\
    chmod +x /opt/certstrap/certstrap &&\
    ln /opt/certstrap/certstrap /usr/local/bin/certstrap &&\
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
