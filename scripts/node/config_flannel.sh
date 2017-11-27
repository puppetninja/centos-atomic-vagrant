#!/bin/bash
FLANNEL_CONF="/etc/sysconfig/flanneld"

sed -i "s@FLANNEL_ETCD_ENDPOINTS.*@FLANNEL_ETCD_ENDPOINTS='http://192.168.122.10:2379'@" ${FLANNEL_CONF}
sed -i "s@FLANNEL_ETCD_PREFIX.*@FLANNEL_ETCD_PREFIX='/atomic.io/network'@" ${FLANNEL_CONF}
