Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  #config.vm.box = "f500/ubuntu-lucid64" # no bugs here
  #config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "ubuntu/vivid64"
  config.vm.box = "ubuntu/wily64"
  #config.vm.box = "larryli/vivid64"
  #config.vm.box = "ubuntu/trusty64"
  #config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "512"
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  #config.ssh.username = 'root'
  #config.ssh.password = 'vagrant'
  #config.ssh.insert_key = 'true'

  config.vm.define "server1" do |server|
     server.vm.network "private_network", ip: "192.168.50.4", :mac => "080027fb9399"
     server.vm.provider "virtualbox" do |vb|
        # vb.memory = "1024"
        # vb.cpus = 4
     end
  end

  config.vm.define "server2" do |server|
     server.vm.network "private_network", ip: "192.168.50.5"
  end

  config.vm.define "serve3" do |server|
     server.vm.network "private_network", ip: "192.168.50.6"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo ifconfig eth1 promisc

    sudo apt-get update
    sudo apt-get -y dist-upgrade
    
    # https://wiki.ubuntu.com/Kernel/MainlineBuilds
    # wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.1-rc7-unstable/linux-headers-4.1.0-040100rc7_4.1.0-040100rc7.201506080035_all.deb
    # wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.1-rc7-unstable/linux-headers-4.1.0-040100rc7-generic_4.1.0-040100rc7.201506080035_amd64.deb
    # wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.1-rc7-unstable/linux-image-4.1.0-040100rc7-generic_4.1.0-040100rc7.201506080035_amd64.deb

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300_4.3.0-040300.201511020949_all.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-image-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb

    sudo dpkg -i *.deb

  SHELL

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
