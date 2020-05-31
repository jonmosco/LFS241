### LFS241 - Monitoring Systems and Services with Prometheus

Notes and various files for the Linux Foundation LFS241 training
NOTE: This repo does not have any of the official files from the training,
      only my personal files used to help with the course.

## Lab Environment

* Vagrantfile for Ubuntu 18.04LTS
* Vagrantfile for Debian 10 - Buster

### Vagrant

Vagrant needs to know that we want to use Libvirt and not default VirtualBox.
That's why there is --provider=libvirt option specified. Other way to tell
Vagrant to use Libvirt provider is to setup environment variable
```
export VAGRANT_DEFAULT_PROVIDER=libvirt
```

Changing the Vagrantfile requires a reload:
```
vagrant reload
```

#### Provisioning with Ansible

The first time you run vagrant up, Vagrant will execute the provisioner and
will record that the provisioner was run. If you halt the virtual machine and
then start it up, Vagrant remembers that it has already run the provisioner
and will not run it a second time.

Force Vagrant to run the provisioner against a running virtual machine:
```
$ vagrant provision
```
Reboot a virtual machine and run the provisioner after reboot:
```
$ vagrant reload --provision
```
Start up a halted virtual machine and have Vagrant run the provisioner:
```
$ vagrant up --provision
```

##### Inventory

Note that it uses default as the inventory hostname. When writing playbooks
for the Vagrant provisioner, specify hosts: default or hosts: all.

### Prometheus cli

Make sure Prometheus reloads it's configuration file:
```
killall -HUP prometheus
```

#### Prometheus Python Client

https://github.com/prometheus/client_python

```bash
pip install prometheus_client
```

#### Grafana

```
docker run -d -p 3000:3000 --name grafana grafana/grafana:5.2.4
```

### Issues

```
Initialization parameters must be an attributes hash, got NilClass nil
```

This error was encountered when changing the location of the storage pool.
It was resolved by restarting libvirtd:
```
$ sudo systemctl restart libvirtd
```
