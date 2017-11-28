#### Vagrant sandbox environment for centos-atomic setup with kubenetes

This is vagrant sandbox environment using shell scripts based on following tutorial
http://www.projectatomic.io/docs/gettingstarted/

This is made for virutalbox on macOS only

##### Usage
run a `vagrant up` followed by `vagrant reload`

see the following after `vagrant status`
```
 ✝  ~/Workspace/centos-atomic   master±  vagrant status
 Current machine states:

 atomic-master             running (virtualbox)
 atomic-node01             running (virtualbox)
 atomic-node02             running (virtualbox)
 atomic-node03             running (virtualbox)
 atomic-node04             running (virtualbox)

 This environment represents multiple VMs. The VMs are all listed
 above with their current state. For more information about a specific
 VM, run `vagrant status NAME`.
```
