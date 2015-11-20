FROM centos:6

RUN cd /usr/local/src \
    wget https://transmission.cachefly.net/transmission-2.84.tar.xz \
    tar xvf transmission-2.84.tar.xz \
    cd transmission-2.84 \
    ./configure --prefix=/usr \
    make \
    make install \

ENV CONFIG_PATH /var/lib/transmission/.config/transmission/settings.json

ENV ENABLE_AUTH true
ENV USER torrent
ENV PASSWORD pwd
ENV ENABLE_WHITELIST false
ENV WHITELIST 127.0.0.1

ENV INCOMPLETE_DIR /opt/incomplete
ENV COMPLETE_DIR /opt/complete
ENV TORRENTS_WATCHDIR /opt/torrents

COPY start.sh /opt/
RUN chmod +x /opt/start.sh

VOLUME /opt/incomplete
VOLUME /opt/complete
VOLUME /opt/torrents

EXPOSE 9091/tcp

WORKDIR /opt/
ENTRYPOINT ./start.sh