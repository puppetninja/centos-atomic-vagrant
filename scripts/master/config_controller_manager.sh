#!/bin/bash

cat > /etc/kubernetes/controller-manager << EOF
# Run with apiserver certs generated ealier
KUBE_CONTROLLER_MANAGER_ARGS="--service-account-private-key-file=/etc/kubernetes/certs/server.key --root-ca-file=/etc/kubernetes/certs/ca.crt"
EOF
