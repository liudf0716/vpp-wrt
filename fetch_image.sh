#!/bin/bash

# install docker
if [[ $(which docker) && $(docker --version) ]]; then
    echo "already install docker"
else
    echo "install docker"
    sudo apt-get update
    sudo apt install docker.io
    sudo systemctl start docker
    shelsudo systemctl enable docker
fi

# install etcd
sudo docker run -d  --network host --name etcd -p 2379:2379 -e ETCDCTL_API=3 \
        quay.io/coreos/etcd /usr/local/bin/etcd \
        -advertise-client-urls http://0.0.0.0:2379 -listen-client-urls http://0.0.0.0:2379

# install vpp-wrt
sudo docker run -d  --network host --name vpp-wrt -p 5002:5002 -p 9191:9191 --privileged liudf0716/vpp-wrt:20.09
