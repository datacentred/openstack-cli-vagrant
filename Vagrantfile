# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

conf = YAML.load_file(File.join(File.dirname(__FILE__), 'config/config.yml'))
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Remove the tty warning
  config.vm.provision "fix-no-tty", type: "shell" do |s|
      s.privileged = false
      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # Message to display at the end
  config.vm.post_up_message = "Setup complete! Please login using 'vagrant ssh' and then test with 'openstack image list'. Enjoy!"

  # Regenerate the default vagrant key
  config.ssh.insert_key = true

  # Begin the config block
  config.vm.define conf["name"] do |srv|

    # Set the hostname and box to load
    srv.vm.hostname = conf["name"]
    srv.vm.box = conf["box"]

    # Enable default synced folder
    srv.vm.synced_folder ".", "/vagrant"

    # Quiet please
    srv.vm.provision "shell", inline: "touch /home/vagrant/.hushlogin"

    # Provision depending on method needed
    case conf['method']
    when "pip"
      srv.vm.provision "shell", path: "scripts/install_pip.sh", privileged: true
    when "apt"
      srv.vm.provision "shell", path: "scripts/install_apt.sh", privileged: true
    else
      raise Vagrant::Errors::VagrantError.new, "Unknown method type"
    end

    # Set the openstack env vars
    srv.vm.provision "file", source: "config/openstack.rc", destination: "/home/vagrant/.bashrc"

    # Configure vmware if being used
    srv.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = conf["ram"]
      vmw.vmx["numvcpus"] = conf["vcpu"]
    end 

    # Configure virtualbox if being used
    srv.vm.provider :virtualbox do |vb|
      vb.memory = conf["ram"]
      vb.cpus = conf["vcpu"]
    end # srv.vm.provider virtualbox
  end # config.vm.define
end # Vagrant.configure
