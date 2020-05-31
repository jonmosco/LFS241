# Debian 10 - Buster
Vagrant.configure("2") do |config|

  config.vm.box = "debian/buster64"

  # Change storage pool location from /var/lib/libvirt/images
  # to custom created storage pool located in home directory
  config.vm.provider :libvirt do |libvirt|
    libvirt.storage_pool_name = "kvm-volumes"
  end

  # Graphana
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  # cAdvisor
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # Main Prometheus server
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  # Demo service ports
  config.vm.network "forwarded_port", guest: 10000, host: 10000
  config.vm.network "forwarded_port", guest: 10001, host: 10001
  config.vm.network "forwarded_port", guest: 10002, host: 10002

  # Run ansible from the host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end

end
