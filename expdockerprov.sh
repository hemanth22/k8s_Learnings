echo "Initialized Prerequistie tools."
yum -y install epel-release
yum -y install wget sudo*
yum -y install figlet
echo "Completed Prerequistie tools installation." | figlet
echo "Initialized Docker Provision." | figlet
wget -O- https://experimental.docker.com/ | sh
usermod -aG docker vagrant
echo "Completed Docker Provision." | figlet
echo "Enabling docker services." | figlet
systemctl start docker
systemctl enable docker
systemctl status -l docker
echo "Completed Services are active and running." | figlet
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
firewall-cmd --add-port=2376/tcp --permanent
firewall-cmd --add-port=2377/tcp --permanent
firewall-cmd --add-port=2377/udp --permanent
echo "Firewall rules configuration complete." | figlet
echo "Restart Firewall." | figlet
firewall-cmd --reload
echo "Firewall restart Completed." | figlet
echo "New Rules patch completed." | figlet
echo "Firewall Network Rules Listing." | figlet
firewall-cmd --list-port
echo "Completed Docker and Network Configuation." | figlet
echo "Provision completed." | figlet
