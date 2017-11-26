#!/bin/bash

mkdir -p /var/lib/local-registry

chcon -Rvt svirt_sandbox_file_t /var/lib/local-registry

docker create -p 5000:5000 \
-v /var/lib/local-registry:/var/lib/registry \
-e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry \
-e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
--name=local-registry registry:2

cat > /etc/systemd/system/local-registry.service << EOF
[Unit]
Description=Local Docker Mirror registry cache
Requires=docker.service
After=docker.service

[Service]
Restart=on-failure
RestartSec=10
ExecStart=/usr/bin/docker start -a %p
ExecStop=-/usr/bin/docker stop -t 2 %p

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable local-registry
systemctl start local-registry
