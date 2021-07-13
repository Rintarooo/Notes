[command]+[alt]+[o]
preview md

# Git command
sourcetree is GUI version


## flow

1. __add__(working tree→index(=stage))

2. __commit__(index→local repository)

3. __push__(local repository into remote repository(GitHub))<br><br>


## Git command

```bash
git init
```
make the working directory git file. <br>
`.git` file means the file organize history and record the time<br><br>

```bash
git add . 
```
add all files in the working directory into index<br><br>

```bash
git add [ファイル名]
```
add specific file<br>
ワーキングツリーの変更をインデックスに反映<br><br>

```bash
git commit -m [コメント]
```
インデックスの変更をローカルリポジトリに反映<br><br>

```bash
git commit --amend -m [コメント]
```
前回のコミットを消して，インデックスの変更をローカルリポジトリに反映<br><br>

```bash
git remote add origin [URL copied from GitHub]
```
リモート名をoriginに省略する<br><br>

$git push <URL copied from GitHub> masters
$git push origin masters
ローカルリポジトリの変更をリモートリポジトリ（GitHub）に反映

もしfatal: remote origin already exists.のエラー出たら
$git remote rm origin
$vim .git/configで登録されたかチェック
$git remote -v






$git status
print working tree status
$git diff 
print the difference between working tree and index(stage)
$git diff —cached
$git diff HEAD

$git log | head — 過去のコミットのハッシュ値を確認
$git log -2 — 過去の2件のコミットのハッシュ値を確認
$git log -p 修正内容・差分表示
$git clone <URL fetched from GitHub> 
GitHub上のリポジトリをローカルに落とす

ブランチ=履歴の先頭コミット
HEAD=最新のコミットのハッシュ値のエイリアス

$git pull origin master --allow-unrelated-histories
pull = fetch + merge
fetch: リモート追跡ブランチ(上流ブランチ(リモート)の内容を取り込むために，自動的に作られる)

$git branch
デフォルトのローカルブランチ名表示
→master
*が現在作業しているブランチ

$git branch -r
リモート追跡ブランチ名(リモート名/ブランチ名)表示
→origin/master

$git remote -v
リモートブランチ名表示
→origin

$git branch [hoge]
枝分かれしたブランチhogeを作る（masterブランチを切る）
$git checkout [hoge]
作業するブランチmaster→hogeに変える
$git branch -d [hoge]
ブランチhogeを消す

$ git reset --hard 昔のコミットのハッシュ値
https://qiita.com/shuntaro_tamura/items/db1aef9cf9d78db50ffe

強制プッシュ
$git push -f origin masters
