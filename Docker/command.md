# Docker コマンドまとめ

## 流れ

1. __pull__ or __build__：DockerHubからimageをローカルにpullするか, Dockerfileをbuildしてローカルにimageを生成するか
2. __run__：imageからコンテナを立ち上げる
3. __rm__　or __rmi__：imageやコンテナを削除<br><br>


```bash
# check installed docker version
docker -v
# check installed docker in details
docker info
```
<br>

```bash
# ローカルにhello-worldという名前のimage無ければ，DockerHubから自動的にimageをローカルにpull
docker run hello-world
```
<br>

```bash
docker image pull [image名:タグ]
# $ docker image pull ubuntu:latest
# DockerHubからDocker host（ローカル）にimageをpull
```
<br>

```bash
# ローカルにあるimageの情報（[イメージID]など）を表示
docker images
=docker image ls
```
<br>

```bash
# イメージを削除
docker rmi [イメージID]
 
# image is being used by stopped container [コンテナID] 
# の出力が出たら，停止しているコンテナを削除する必要がある

# <none>イメージを削除
docker image prune

```
<br>


```bash
# コンテナを削除（停止しているコンテナのみ削除できる，つまり立ち上げているコンテナは停止させる必要がある）
docker rm [コンテナID]

# 立ち上げているコンテナの[コンテナID]確認
docker ps
# ps = process status

# docker ps同様のコマンド
docker container ls 
docker container ls -a

docker ps -alq
# -a = all（立ち上げている，停止している，全てのコンテナ）
# -l = latest
# -q, [コンテナID]のみ表示

# 立ち上げているコンテナを停止
docker stop [コンテナID]

# https://qiita.com/shisama/items/48e2eaf1dc356568b0d7
# 立ち上げている全てのコンテナ停止
docker stop $(docker ps -q)

# 全コンテナ削除
docker rm $(docker ps -q -a)
docker container prune
```
<br>


```bash
# runはimageからコンテナの立ち上げ
docker run -it --rm alpine /bin/sh

docker run -it --rm alpine/git:latest /bin/bash
# alpine/git:latest
# イメージの名前:タグの名前

# コンテナに入ると
# root@[コンテナID]:/

# コンテナから抜ける（コンテナを停止する）
exit 
# または
[control]+d

docker run -it --rm -v $HOME/coding/:/opt/coding -w /opt/coding ros:kinetic-ros-base

# 引数の説明
-it
# -i = standard input
# -t = psuedo terminal
# コンテナの中で対話的(interactive)に作業をしたい

--rm
# コンテナから抜けたとき，自動的にimage削除

-v ${PWD}:[コンテナ内のパス]
--volume
# mount 
# ホスト側のファイルをコンテナ内で使いたいときに使う
# ${PWD}はホスト側のカレントディレクトリの絶対パス（相対パスはダメ）
# -v $HOME/coding/:/opt/coding

-w
--workdir
# Working directory inside the container
# これ使わないとコンテナのルートディレクトリから始まる

-e
--env
# 環境変数を設定

--name
# コンテナの名前つける

--gpus=all
# 使えるgpu全部使う
```
<br>

```bash
docker build -t イメージの名前:タグの名前 ./
# -t/--tag 
# 「イメージの名前:タグの名前」のイメージを，カレントディレクトリにあるDockerfileをもとにビルドして作成
```
<br>

