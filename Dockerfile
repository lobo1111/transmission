FROM centos:6

RUN wget http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
RUN rpm -Uvh epel-release-6-8.noarch.rpm
RUN yum -y install transmission transmission-daemon