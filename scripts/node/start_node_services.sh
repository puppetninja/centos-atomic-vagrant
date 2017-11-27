#!/bin/bash

systemctl daemon-reload

systemctl enable flanneld kubelet kube-proxy
# Don't do the reboot now,
# try start with systemd first
systemctl start flanneld kubelet kube-proxy
