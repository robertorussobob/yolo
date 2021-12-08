#!/bin/sh

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y \
docker-ce docker-ce-cli containerd.io tar bzip2 \
make automake gcc gcc-c++ pciutils \
elfutils-libelf-devel libglvnd-devel iptables \
firewalld vim bind-utils wget git
sudo systemctl start docker
sudo docker run hello-world
git clone https://github.com/AlexeyAB/darknet.git
cd darknet/build/darknet/x64
curl -L -O \
https://pjreddie.com/media/files/yolov3.weights
sudo docker run --rm \
-v $PWD:/workspace -w /workspace \
daisukekobayashi/darknet:cpu \
darknet detector test data/coco.data yolov3.cfg \
yolov3.weights -i 0 -thresh 0.25 \
dog.jpg -ext_output

