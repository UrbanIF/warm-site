# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "phusion/ubuntu-14.04-amd64"

  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
  # Forward the Rails server default port to the host
  config.vm.network "forwarded_port", guest: 3000, host: 1234


end
