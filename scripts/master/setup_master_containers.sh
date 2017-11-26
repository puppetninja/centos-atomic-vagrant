#!/bin/bash

# Install atomic system containers for master node
# 1.
# comment out installing master containers with atomic install, atomic install is based on runC.
#
#atomic install --system --system-package=no --name kube-apiserver registry.centos.org/centos/kubernetes-sig-apiserver:latest
#atomic install --system --system-package=no --name kube-scheduler registry.centos.org/centos/kubernetes-sig-scheduler:latest
#atomic install --system --system-package=no --name kube-controller-manager registry.centos.org/centos/kubernetes-sig-controller-manager:latest
#
# 2.
# systemd service conf is using docker engine instead of runC by atomic install as mentioned above.
cat > /etc/systemd/system/kube-apiserver.service << EOF
[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker stop %n
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull registry.centos.org/centos/kubernetes-apiserver
ExecStart=/usr/bin/docker run --rm --net=host -p 443:443 -v /etc/kubernetes:/etc/kubernetes:z --name %n registry.centos.org/centos/kubernetes-sig-apiserver

[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/kube-controller-manager.service << EOF
[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker stop %n
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull registry.centos.org/centos/kubernetes-controller-manager
ExecStart=/usr/bin/docker run --rm --net=host -v /etc/kubernetes:/etc/kubernetes:z --name %n registry.centos.org/centos/kubernetes-sig-controller-manager

[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/kube-scheduler.service << EOF
[Unit]
Description=Kubernetes Scheduler Plugin
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker stop %n
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull registry.centos.org/centos/kubernetes-scheduler
ExecStart=/usr/bin/docker run --rm --net=host -v /etc/kubernetes:/etc/kubernetes:z --name %n registry.centos.org/centos/kubernetes-sig-scheduler

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable kube-apiserver kube-scheduler kube-controller-manager
systemctl start kube-apiserver kube-scheduler kube-controller-manager
