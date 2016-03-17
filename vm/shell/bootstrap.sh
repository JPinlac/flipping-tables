#!/usr/bin/env bash

echo -e "[SHELL-BOOTSTRAP] executing...\n";


echo -e "[APT] update...\n";
apt-get update
apt-get install -y


echo -e "[ANDROID SDK] downloading...\n";
ANDROID_SDK_FILENAME=android-sdk_r24-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME
echo -e "[ANDROID SDK] installing...\n";
curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
echo -e "[ANDROID SDK] updating...\n";
expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,build-tools-22.0.1
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'
echo -e "[ANDROID SDK] chown to vagrant...\n";
sudo chown -R vagrant:vagrant android-sdk-linux/


echo -e "[NODE] Setting up npm config\n";
npm config set registry http://registry.npmjs.org/
npm config set user-agent "npm/2.6.0 node/v0.10.36 linux x64"


echo -e "[IONIC] installing n\n";
sudo npm install -g n
sudo n 4.2.2 # latest LTS node version
echo -e "[IONIC] installing cordova\n";
sudo npm install -g cordova
echo -e "[IONIC] installing ionic package\n";
sudo npm install -g ionic
echo -e "[IONIC] installing gulp\n";
sudo npm install -g gulp


echo -e "[DOT-FILES] installing...\n";
sudo rm -rf /home/vagrant/.bash_profile
ln -s /vagrant/vm/dot-files/bash_profile /home/vagrant/.bash_profile
sudo rm -rf /home/vagrant/.bashrc
ln -s /vagrant/vm/dot-files/bashrc /home/vagrant/.bashrc
sudo rm -rf /home/vagrant/.bashrc.d
ln -s /vagrant/vm/dot-files/bashrc.d /home/vagrant/.bashrc.d
sudo rm -rf /home/vagrant/.gitignore_global
ln -s /vagrant/vm/dot-files/gitignore_global /home/vagrant/.gitignore_global
sudo rm -rf /home/vagrant/.profile
ln -s /vagrant/vm/dot-files/profile /home/vagrant/.profile
sudo rm -rf /home/vagrant/.tmux.conf
ln -s /vagrant/vm/dot-files/tmux.conf /home/vagrant/.tmux.conf
sudo rm -rf /home/vagrant/.vim
ln -s /vagrant/vm/dot-files/vim /home/vagrant/.vim
sudo rm -rf /home/vagrant/.vimrc
ln -s /vagrant/vm/dot-files/vimrc /home/vagrant/.vimrc
sudo rm -rf /home/vagrant/.bin
ln -s /vagrant/vm/dot-files/bin /home/vagrant/.bin


echo -e "[SHELL-BOOTSTRAP] completed ;) \n";
