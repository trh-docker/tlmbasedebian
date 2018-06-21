FROM debian:stretch-slim

ADD https://zinc.tpnfc.us/TLM.crt /usr/local/share/ca-certificates/

RUN mkdir /opt/ssl/ /opt/ssl/certs &&\
    apt-get update && apt-get install -y ca-certificates &&            update-ca-certificates --verbose &&\
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
