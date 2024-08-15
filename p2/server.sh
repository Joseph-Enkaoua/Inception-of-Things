#!/bin/bash

if export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110 "; then
    echo -e "export OK"
else
    echo -e "export Failed"
fi

if curl -sfL https://get.k3s.io | sh -; then
    echo -e "K3s OK"
else
    echo -e "K3s Failed"
fi

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up; then
    echo -e "Network OK"
else
    echo -e "Network Failed"
fi