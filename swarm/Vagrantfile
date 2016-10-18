VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/xenial64"

    config.vm.define "server1" do |server|
        server.vm.hostname = "server1"
        server.vm.provision "shell", path: "provision/docker.sh"
        server.vm.network :private_network, ip: "10.0.15.21"
    end

    config.vm.define "server2" do |server|
        server.vm.hostname = "server2"
        server.vm.provision "shell", path: "provision/docker.sh"
        server.vm.network :private_network, ip: "10.0.15.22"
    end

    config.vm.define "server3" do |server|
        server.vm.hostname = "server3"
        server.vm.provision "shell", path: "provision/docker.sh"
        server.vm.network :private_network, ip: "10.0.15.23"
    end

end
