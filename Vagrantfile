# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
project_settings = YAML.load_file('vm/Vagrantsettings.yaml')

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = project_settings['box']['name']
  
  config.vm.network :forwarded_port, guest: 8100, host: 8100
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  # shared folders
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "..", "/data"

  # Custom variables
  config.vm.hostname =  project_settings['vm']['hostname']
  timezone = project_settings['vm']['timezone']
  memory = project_settings['vm']['memory']

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = project_settings['vm']['name']
    vb.customize ["modifyvm", :id, "--memory", project_settings['vm']['memory']]
    # Enable USB for Android device
    vb.customize ["modifyvm", :id, "--usb", "on"]
    #vb.customize ["usbfilter", "add", "0", "--target", :id, "1197123b", "--vendorid", "0x04e8"]
    vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = project_settings['puppet']['manifests_path']
    puppet.manifest_file  = project_settings['puppet']['manifest_file']
    puppet.options = project_settings['puppet']['options']
  end

  config.vm.provision :shell, :path => "vm/shell/bootstrap.sh"
  config.vm.provision :shell, run: "always", :path => "vm/shell/init.sh"
end
