#!/bin/bash

systemctl daemon-reload
systemctl enable etcd kube-apiserver kube-scheduler kube-controller-manager
systemctl start etcd kube-apiserver kube-scheduler kube-controller-manager
