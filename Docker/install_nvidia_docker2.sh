#!/bin/bash
# https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-docker-ce

# distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
#    && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
#    && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# sudo apt-get update

# sudo apt-get install -y nvidia-docker2

# sudo systemctl restart docker

# docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

# this command pull 4.6GB image
# docker run --gpus all -it --rm --name tensorflow-gpu -p 8888:8888 tensorflow/tensorflow:latest-gpu-py3-jupyter