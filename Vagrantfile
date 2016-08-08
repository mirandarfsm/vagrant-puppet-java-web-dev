# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #config.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
  config.vm.box = "puppetlabs/debian-8.2-64-puppet"
  #config.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
  #config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  
  # Librarian Puppet settings 
  # Install it: vagrant plugin install vagrant-librarian-puppet
  config.librarian_puppet.use_v1_api = "1"
  config.librarian_puppet.destructive = true
  config.librarian_puppet.tmp = "D:/libtmp"

  # Proxy settings
  # Install it: vagrant plugin install vagrant-proxyconf
  #PROXY="" 
  #config.proxy.http     = PROXY
  #config.proxy.https    = PROXY
  #config.proxy.no_proxy = "localhost,127.0.0.1,.intraer,192.168.0.0/16,10.0.0.0/8"

  config.vm.provision "shell", inline: "apt-get update --fix-missing"


  # Module Web Config
  config.vm.define :web do |web_config|
    
    # Settings about cpu, memory and GUI
    web_config.vm.provider "virtualbox" do |vbox|
      vbox.gui = true
    #  vbox.cpus = 4
    #  vbox.memory = 4198
    end

    # Set a private network to work in VM
    #web_config.vm.network :private_network, :ip => "192.168.33.10", virtualbox__intnet: true
    
    # If need to use like a server, you can set a port to forwarded
    #web_config.vm.network "forwarded_port", guest: 8080, host: '8080'

    # Shared folder
    #web_config.vm.synced_folder "../", "/home/vagrant/project"

    # Puppet Settings
    web_config.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifests_path = "environments/web/manifests"
      puppet.manifest_file = "web1.pp"
      puppet.environment_path = "environments"
      puppet.environment = "web"
      puppet.options = "--verbose"
    end
  end

  # Module Database Config
  #config.vm.define :db do |db_config|
    #db_config.vm.network :private_network, :ip => "192.168.33.11", virtualbox__intnet: true
    #db_config.vm.network "forwarded_port", guest: 5432, host: 5432
    
    #db_config.vm.provision "puppet" do |puppet|
      #puppet.module_path = ["modules"]
      #puppet.manifests_path = "environments/db/manifests"
      #puppet.manifest_file = "db.pp"
      #puppet.environment_path = "environments"
      #puppet.environment = "db"
    #end
  #end

end
