echo "Initialized Prerequistie tools."
yum -y install epel-release
yum -y install wget sudo*
yum -y install figlet
yum -y install qemu-kvm libvirt libvirt-daemon-kvm
yum -y install ansible*
echo "Completed Prerequistie tools installation." | figlet
echo "Initialized Docker Provision." | figlet
wget -O- https://get.docker.com/ | sh
usermod -aG docker vagrant
echo "Completed Docker Provision." | figlet
echo "Enabling services." | figlet
systemctl start docker
systemctl enable docker
systemctl status -l docker
systemctl start libvirtd
systemctl enable libvirtd
systemctl status -l libvirtd
echo "Completed Services are active and running." | figlet
echo "Get and Put Kubernetes repository." | figlet
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
echo "Get and Put Kubernetes completed." | figlet
echo "Installating Kubernetes provision." | figlet
yum install -y kubectl
echo "Kubernetes provisioning Completed." | figlet
echo "Started Network Provision." | figlet
echo "Enabling Firewall services." | figlet
systemctl start firewalld
systemctl enable firewalld
systemctl status -l firewalld
echo "Firewall Services are active and running." | figlet
echo "Adding Rules to firewall." | figlet
firewall-cmd --add-port=4789/tcp --permanent
firewall-cmd --add-port=4789/udp --permanent
firewall-cmd --add-port=2789/tcp --permanent
firewall-cmd --add-port=2789/udp --permanent
firewall-cmd --add-port=7946/tcp --permanent
firewall-cmd --add-port=7946/udp --permanent
firewall-cmd --add-port=2377/tcp --permanent
firewall-cmd --add-port=2376/tcp --permanent
firewall-cmd --add-port=2377/udp --permanent
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --add-port=80/tcp --permanent
echo "Firewall rules configuration complete." | figlet
echo "Restart Firewall." | figlet
firewall-cmd --reload
echo "Firewall restart Completed." | figlet
echo "New Rules patch completed." | figlet
echo "Firewall Network Rules Listing." | figlet
firewall-cmd --list-port
echo "Completed Docker and Network Configuation." | figlet
echo "Provision completed." | figlet
