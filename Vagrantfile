# -*- mode: ruby -*-
# vi: set ft=ruby :

# This is based on the following tutorial for atomic sandbox setup
# http://www.projectatomic.io/docs/gettingstarted/
Vagrant.configure(2) do |config|

  $atomic_master_mem = 2048
  $atomic_master_vcpu = 2

  $atomic_node_mem = 1024
  $atomic_node_vcpu = 1

  $atomic_node_number = 3
  $atomic_network = "192.168.122"

  config.vm.box = "centos/atomic-host"
  config.vm.box_check_update = true

  # Disable swap for each vm
  # https://github.com/kubernetes/kubernetes/issues/7294
  config.vm.provision "shell", inline: "swapoff -a"

  # Install packages needed for sandbox environment
  config.vm.provision "shell", inline: "rpm-ostree install git tree vim"
  # I would rather do vagrant reload now...
  #config.vm.provision "shell", inline: "rpm-ostree ex livefs"

  # Provision atomic master and node-0[1-4]
  config.vm.define "atomic-master" do |master|
    master.vm.hostname = "atomic-master.local"
    master.vm.network "private_network", ip: "#{$atomic_network}.10"

    master.vm.provider :virtualbox do |vb|
      vb.memory = $atomic_master_mem
      vb.cpus = $atomic_master_vcpu
    end

    # Setup optional local registry for fast docker image pulling
    master.vm.provision "shell", path: "scripts/master/setup_local_registry.sh"
    # Configure the etcd service running on master
    master.vm.provision "shell", path: "scripts/master/config_etcd.sh"
    # Generate certificate for master authentication
    master.vm.provision "shell", path: "scripts/master/generate_cert.sh"
    # Configure general kubernetes settings
    master.vm.provision "shell", path: "scripts/master/config_kubernetes.sh"
    # Configure apiserver
    master.vm.provision "shell", path: "scripts/master/config_apiserver.sh"
    # Configure controller manager
    master.vm.provision "shell", path: "scripts/master/config_controller_manager.sh"
    # centos atomic master packages are now containerized,
    # more details:
    # https://wiki.centos.org/SpecialInterestGroup/Atomic/ContainerizedMaster
    master.vm.provision "shell", path: "scripts/master/setup_master_containers.sh"
    # Start master services and etcd on master node
    master.vm.provision "shell", path: "scripts/master/start_master_services.sh"
    # Configure flannel setups
    master.vm.provision "shell", path: "scripts/master/setup_flannel.sh"
  end

  # TODO: atomic nodes need to be defined in a loop, obviously...
  config.vm.define "atomic-node01" do |node|
      node.vm.hostname = "atomic-node01.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.11"

      node.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end

      # Configure docker to use local registry
      node.vm.provision "shell", path: "scripts/node/config_docker.sh"
      # Configure flannel for the node
      node.vm.provision "shell", path: "scripts/node/config_flannel.sh"
      # Configure kubernetes and Kuberlet
      node.vm.provision "shell", path: "scripts/node/config_kubernetes.sh"
      # Start services running on the node
      node.vm.provision "shell", path: "scripts/node/start_node_services.sh"
  end

  config.vm.define "atomic-node02" do |node|
      node.vm.hostname = "atomic-node02.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.12"

      node.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end

      # Configure docker to use local registry
      node.vm.provision "shell", path: "scripts/node/config_docker.sh"
      # Configure flannel for the node
      node.vm.provision "shell", path: "scripts/node/config_flannel.sh"
      # Configure kubernetes and Kuberlet
      node.vm.provision "shell", path: "scripts/node/config_kubernetes.sh"
      # Start services running on the node
      node.vm.provision "shell", path: "scripts/node/start_node_services.sh"
  end

  config.vm.define "atomic-node03" do |node|
      node.vm.hostname = "atomic-node03.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.13"

      node.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end

      # Configure docker to use local registry
      node.vm.provision "shell", path: "scripts/node/config_docker.sh"
      # Configure flannel for the node
      node.vm.provision "shell", path: "scripts/node/config_flannel.sh"
      # Configure kubernetes and Kuberlet
      node.vm.provision "shell", path: "scripts/node/config_kubernetes.sh"
      # Start services running on the node
      node.vm.provision "shell", path: "scripts/node/start_node_services.sh"
  end

  config.vm.define "atomic-node04" do |node|
      node.vm.hostname = "atomic-node04.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.14"

      node.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end

      # Configure docker to use local registry
      node.vm.provision "shell", path: "scripts/node/config_docker.sh"
      # Configure flannel for the node
      node.vm.provision "shell", path: "scripts/node/config_flannel.sh"
      # Configure kubernetes and Kuberlet
      node.vm.provision "shell", path: "scripts/node/config_kubernetes.sh"
      # Start services running on the node
      node.vm.provision "shell", path: "scripts/node/start_node_services.sh"
  end

  ####
end
