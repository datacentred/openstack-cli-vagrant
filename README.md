# Datacentred Openstack CLI Tools - Vagrant  

## Prerequisites

A working Vagrant installation. For more details, please refer to ([http://www.vagrantup.com](http://www.vagrantup.com))
Both Virtualbox and VMWare hypervisors on Windows, OSX and Linux should work just fine.  

*Please note - We're sorry, but we can't offer support on Vagrant/Hypervisor issues. Please refer to their relevant websites for support information*.

## Configuration 

* **config/config.yaml**: Choose the installation method (pip and apt are supported, pip is preferred) 
* **config/openstack.rc**: Contains the Openstack credentials. Update this with your tenant (aka project) and username (in the form of user@domain.tld)


## Instructions 

1) Set up Vagrant (and Virtualbox or VMware) if not already.

2) Clone or Download this repository. ie. ```git clone https://github.com/datacentred/openstack-cli-vagrant.git```

3) In a terminal (or command prompt) - cd to the directory ```cd openstack-cli-vagrant```

4) Edit **config/openstack.rc** and enter your Datacentred credentials. 

5) Start and provision the Vagrant box ```vagrant up```

It will look as follows;
```
» vagrant up                     
Bringing machine 'datacentred-openstack-cli' up with 'virtualbox' provider...
==> datacentred-openstack-cli: Box 'ubuntu/trusty64' could not be found. Attempting to find and install...
    datacentred-openstack-cli: Box Provider: virtualbox
    datacentred-openstack-cli: Box Version: >= 0
==> datacentred-openstack-cli: Loading metadata for box 'ubuntu/trusty64'
    datacentred-openstack-cli: URL: https://atlas.hashicorp.com/ubuntu/trusty64
==> datacentred-openstack-cli: Adding box 'ubuntu/trusty64' (v20160815.0.0) for provider: virtualbox
    datacentred-openstack-cli: Downloading: https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20160815.0.0/providers/virtualbox.box
==> datacentred-openstack-cli: Successfully added box 'ubuntu/trusty64' (v20160815.0.0) for 'virtualbox'!
==> datacentred-openstack-cli: Importing base box 'ubuntu/trusty64'...
==> datacentred-openstack-cli: Matching MAC address for NAT networking...
...
 - install text, removed for brevity
...
==> datacentred-openstack-cli:
==> datacentred-openstack-cli: Setup complete! Please login using 'vagrant ssh' and then test with 'openstack image list'. Enjoy!
```

6) Log into the Vagrant box ```vagrant ssh```

You will now have a prompt like so:
```
vagrant@datacentred-openstack-cli:~$
```

7) Check it's working! ```openstack image list```

```
vagrant@datacentred-openstack-cli:~$ openstack image list
+--------------------------------------+-----------------------------------------+--------+
| ID                                   | Name                                    | Status |
+--------------------------------------+-----------------------------------------+--------+
| 17d3caff-2949-4081-a5d0-2183eda27292 | image.test.one                          | active |
| 8682a3d7-339c-49c8-bac7-a80773c4013e | image.test.two                          | active |
| ffc53bce-9d5d-46b6-a847-bc6ed27bcc35 | image.test.three                        | active |
....
```

## Maintenance

### Updating Credentials

If you've updated your openstack credentials, then simply update **config/openstack.rc** then run ```vagrant provision``` and log into your Vagrant box again. You will now have updated credentials set for the CLI tools




