# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provision "shell", inline: <<-SHELL
    sed -r -i 's/^# deb-src/deb-src/g' /etc/apt/sources.list
    apt-get update -qq
    apt-get -qq build-dep linux linux-image-$(uname -r) fakeroot
    snap install go --channel=1.19/stable --classic
    cd /vagrant
    go mod download
    go mod download github.com/prometheus/procfs
    go get github.com/prometheus/procfs/sysfs@v0.8.0
    if [ ! -d ubuntu-focal ]; then git clone git://kernel.ubuntu.com/ubuntu/ubuntu-focal.git; fi
  SHELL

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 10
  end
end
