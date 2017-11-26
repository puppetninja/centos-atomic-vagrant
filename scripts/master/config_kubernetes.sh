#!/bin/bash

cat > /etc/kubernetes/config << EOF
# Comma separated list of nodes in the etcd cluster
KUBE_ETCD_SERVERS="--etcd_servers=http://192.168.122.10:2379"

# How the controller-manager, scheduler, and proxy find the kube-apiserver
KUBE_MASTER="--master=http://192.168.122.10:6443"
EOF
