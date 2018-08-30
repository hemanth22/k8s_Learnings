sudo firewall-cmd --add-port=4789/tcp --permanent
sudo firewall-cmd --add-port=4789/udp --permanent
sudo firewall-cmd --add-port=2789/tcp --permanent
sudo firewall-cmd --add-port=2789/udp --permanent
sudo firewall-cmd --add-port=7946/tcp --permanent
sudo firewall-cmd --add-port=7946/udp --permanent
sudo firewall-cmd --add-port=2377/tcp --permanent
sudo firewall-cmd --add-port=2376/tcp --permanent
sudo firewall-cmd --add-port=2377/udp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-port
