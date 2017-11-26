#!/bin/bash
MASTER_IP=192.168.122.10

curl -L -O https://storage.googleapis.com/kubernetes-release/easy-rsa/easy-rsa.tar.gz
tar xzf easy-rsa.tar.gz

cd easy-rsa-master/easyrsa3

./easyrsa init-pki
./easyrsa --batch "--req-cn=${MASTER_IP}@`date +%s`" build-ca nopass
./easyrsa --subject-alt-name="IP:${MASTER_IP}" build-server-full server nopass

KUBERNETES_CERT_DIR="/etc/kubernetes/certs"
mkdir ${KUBERNETES_CERT_DIR}

for i in {pki/ca.crt,pki/issued/server.crt,pki/private/server.key}
do
    cp $i ${KUBERNETES_CERT_DIR}
done

chown -R kube:kube ${KUBERNETES_CERT_DIR}
