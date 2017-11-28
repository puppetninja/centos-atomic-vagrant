#!/bin/bash
KUBERNETES_CONF="/etc/kubernetes/config"
KUBELET_CONF="/etc/kubernetes/kubelet"

case $(hostname -s) in
    atomic-node01)
        KUBELET_ADDR="192.168.122.11"
        ;;
    atomic-node02)
        KUBELET_ADDR="192.168.122.12"
        ;;
    atomic-node03)
        KUBELET_ADDR="192.168.122.13"
        ;;
    atomic-node04)
        KUBELET_ADDR="192.168.122.14"
        ;;
esac

# How the controller-manager, scheduler, and proxy find the kube-apiserver
# But why it will be configured on kubernetes nodes ?
sed -i "s@KUBE_MASTER.*@KUBE_MASTER='--master=http://192.168.122.10:8080'@" ${KUBERNETES_CONF}

# configure the kubelets
sed -i "s@KUBELET_ADDRESS.*@KUBELET_ADDRESS=\"--address=${KUBELET_ADDR}\"@" ${KUBELET_CONF}
sed -i "s@KUBELET_HOSTNAME.*@KUBELET_HOSTNAME=\"--hostname_override=${KUBELET_ADDR}\"@" ${KUBELET_CONF}
sed -i "s@KUBELET_API_SERVER.*@KUBELET_API_SERVER=\"--api_servers=http://192.168.122.10:8080\"@" ${KUBELET_CONF}
