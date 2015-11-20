#!/bin/bash

cd /etc/yum.repos.d/
wget http://geekery.altervista.org/geekery-el6-x86_64.repo
yum -y install transmission-daemon