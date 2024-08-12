sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

sudo apt remove -y vim
sudo apt remove -y curl

sudo /usr/local/bin/k3s-uninstall.sh
