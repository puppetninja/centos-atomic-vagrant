#!/bin/bash

cat >> /etc/hosts << EOF
192.168.122.10 atomic-master.local atomic-master
192.168.122.11 atomic-node01.local atomic-node01
192.168.122.12 atomic-node02.local atomic-node02
192.168.122.13 atomic-node03.local atomic-node03
192.168.122.14 atomic-node04.local atomic-node04
EOF
