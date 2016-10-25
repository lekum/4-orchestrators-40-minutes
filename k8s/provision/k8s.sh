#! /bin/bash
apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

cat << EOF > /etc/apt/sources.list.d/docker.list
deb https://apt.dockerproject.org/repo ubuntu-xenial main
EOF

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual docker-engine kubelet kubeadm kubectl kubernetes-cni
#sed -i 's#ExecStart=.*#ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375#' /lib/systemd/system/docker.service
#systemctl daemon-reload
#service docker restart
adduser ubuntu docker
