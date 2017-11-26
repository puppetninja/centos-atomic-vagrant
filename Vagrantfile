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

  config.vm.define "atomic-master" do |master|
    master.vm.hostname = "atomic-master.local"
    master.vm.network "private_network", ip: "#{$atomic_network}.10"

    config.vm.provider :virtualbox do |vb|
      vb.memory = $atomic_master_mem
      vb.cpus = $atomic_master_vcpu
    end
  end

  config.vm.define "atomic-node01" do |node|
      node.vm.hostname = "atomic-node01.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.11"

      config.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end
  end

  config.vm.define "atomic-node02" do |node|
      node.vm.hostname = "atomic-node02.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.12"

      config.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end
  end

  config.vm.define "atomic-node03" do |node|
      node.vm.hostname = "atomic-node03.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.13"

      config.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end
  end

  config.vm.define "atomic-node04" do |node|
      node.vm.hostname = "atomic-node04.local"
      node.vm.network "private_network", ip: "#{$atomic_network}.14"

      config.vm.provider :virtualbox do |vb|
        vb.memory = $atomic_node_mem
        vb.cpus = $atomic_node_vcpu
      end
  end
end
