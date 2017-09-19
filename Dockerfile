FROM ubuntu:xenial
MAINTAINER sh@analogic.cz

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
ENTRYPOINT ["/init"]

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin-abc/ppa && \
    apt-get update && \
    apt-get install -y bitcoin-abc nmap

RUN mkdir /var/run/bitcoind

EXPOSE 18332 18335

VOLUME ["/data"]
ADD rootfs /
