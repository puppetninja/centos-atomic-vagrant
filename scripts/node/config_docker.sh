#!/bin/bash
DOCKER_CONF="/etc/sysconfig/docker"

sed -i "s@OPTIONS.*@OPTIONS='--registry-mirror=http://192.168.122.10:5000 --selinux-enabled --log-driver=journald'@" ${DOCKER_CONF}
