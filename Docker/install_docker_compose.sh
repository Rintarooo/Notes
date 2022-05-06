# https://knowledge.sakura.ad.jp/16862/
# cd Notes/Docker && sudo ./install_docker_compose.sh

# https://qiita.com/kottyan/items/c892b525b14f293ab7b3
# version 1.29.1
sudo curl -L https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v