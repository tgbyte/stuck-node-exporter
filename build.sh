#!/bin/bash
cd /vagrant || exit 2
rm *.deb
cd /vagrant/ubuntu-focal || exit 2
LANG=C fakeroot debian/rules clean
LANG=C fakeroot debian/rules binary-headers binary-generic binary-perarch
cd /vagrant || exit 2
sudo dpkg -i linux-image-unsigned-5.4.0-132-generic_5.4.0-132.148_amd64.deb linux-modules-5.4.0-132-generic_5.4.0-132.148_amd64.deb
