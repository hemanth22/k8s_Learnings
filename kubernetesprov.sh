echo "Initialized Prerequistie tools."
yum -y install epel-release
yum -y install wget sudo*
yum -y install figlet vim
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
echo "Started Network Provision." | figlet
echo "Enabling Firewall services." | figlet
systemctl start firewalld
systemctl enable firewalld
systemctl status -l firewalld
echo "Firewall Services are active and running." | figlet
echo "Adding Rules to firewall." | figlet
firewall-cmd --add-port=4789/tcp --permanent
firewall-cmd --add-port=2789/tcp --permanent
firewall-cmd --add-port=7946/tcp --permanent
firewall-cmd --add-port=2377/tcp --permanent
firewall-cmd --add-port=2376/tcp --permanent
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
echo "Download Kubernetes modules from ansible galaxy" | figlet
ansible-galaxy install geerlingguy.kubernetes
echo "Completed downloading module" | figlet
echo "Download and install kubernetes.playbook" | figlet
wget -O kubernetes.playbook https://gist.githubusercontent.com/hemanth22/871f04f7110ff1ce60da05f9c5b1e766/raw/b28b1a24ce28605796fb56104635e1240d2d28cb/kubernetes.playbook
ansible-playbook kubernetes.playbook
echo "Completed kubernetes.playbook installation." | figlet
echo "Provision completed." | figlet
