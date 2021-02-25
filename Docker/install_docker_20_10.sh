#!/bin/bash


# https://qiita.com/tkyonezu/items/0f6da57eb2d823d2611d
# https://docs.docker.com/engine/install/ubuntu/
# https://www.softek.co.jp/SID/support/sidfmvm/guide/install-docker-ubuntu1804.html

# sudo apt-get install \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg-agent \
#     software-properties-common 

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 

#  sudo apt-key fingerprint 0EBFCD88
	# make sure outputs are 9DC8~
	# pub   rsa4096 2017-02-22 [SCEA]
	#       9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
	# uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
	# sub   rsa4096 2017-02-22 [S]

# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
# sudo usermod -aG docker $USER

# docker info
# docker images
# docker run --rm hello-world
# docker rmi hello-world
docker info | grep -i version
