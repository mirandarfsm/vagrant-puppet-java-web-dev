# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_url = "https://atlas.hashicorp.com/hashicorp/boxes/precise64"

  config.librarian_puppet.puppetfile_dir = "librarian"
  config.librarian_puppet.use_v1_api = "1"
  config.librarian_puppet.destructive = false

  #config.r10k.puppet_dir = 'librarian' # the parent directory that contains your module directory and Puppetfile
  #config.r10k.puppetfile_path = 'librarian/Puppetfile'

  # Proxy settings
  #config.proxy.http     = PROXY
  #config.proxy.https    = PROXY
  #config.proxy.no_proxy = "localhost,127.0.0.1,.intraer,192.168.0.0/16,10.0.0.0/8"
  #config.memory = "1024"

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
    #web_config.vm.synced_folder "../", "/home/vagrant/adoc"

    # Puppet Settings
    web_config.vm.provision "puppet" do |puppet|
      #puppet.module_path = ["modules"]
      puppet.module_path = ["modules", "librarian/modules"]
      puppet.manifest_file = "web.pp"
    end
  end

  # Module Database Config
  #config.vm.define :db do |db_config|
    #db_config.vm.network :private_network, :ip => "192.168.33.11", virtualbox__intnet: true
    #db_config.vm.network "forwarded_port", guest: 5432, host: 5432
    
    #db_config.vm.provision "puppet" do |puppet|
    #  puppet.module_path = ["modules","librarian/modules"]
    #  puppet.manifest_file = "db.pp"
    #end
  #end

end
