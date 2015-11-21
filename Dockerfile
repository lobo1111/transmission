FROM centos:6

RUN yum -y install wget
RUN cd /etc/yum.repos.d/; \
    wget http://geekery.altervista.org/geekery-el6-x86_64.repo; \
    yum -y install transmission-daemon;

ENV CONFIG_PATH /var/lib/transmission/settings.json

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