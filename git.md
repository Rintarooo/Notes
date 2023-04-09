- #### OmniMarkupPreviewer
	- OmniMarkupPreviewer is the package of SublimeText for preview markdown in a browser
		- preview markdown in a browser
			- [command]+[alt]+[o] 

# Git command
sourcetree is GUI version


## 流れ

1. __add__：working tree→index(=stage)

2. __commit__：index→local repository

3. __push__：local repository→remote repository(=GitHub)<br><br>


## Git command

### 基本操作

```bash
# カレントディレクトリをgitでバージョン管理し始める. 
git init
# カレントディレクトリに隠しディレクトリの`.git/`が生成される．
# この.gitディレクトリが、Gitのリポジトリの実体．リポジトリとは，Gitがファイルの履歴を保存している場所のこと．ローカルの環境にあるので，ローカリリポジトリになる．
```
<br><br>

```bash
# ワーキングツリーの差分（＝変更）をインデックスに反映
git add [ファイル名]
# `git add [ファイル名]` は単一のファイルのみ
git add . 
# `git add .`と`git add -A` は全てのファイル
```
<br><br>

```bash
# インデックスの差分をローカルリポジトリに反映
git commit -m [コメント]
```


```bash
# 前回のコミットを消して，インデックスの差分をローカルリポジトリに反映
git commit --amend -m [コメント]
```
<br><br>

```bash
# GitHub上のリモートリポジトリのパス（URL）をoriginに省略する
git remote add origin [URL copied from GitHub]
# 例：git remote add origin　https://github.com/Rintarooo/Notes.git
```
<br><br>

```bash
# masterブランチにおけるローカルリポジトリの差分をリモートリポジトリ（GitHub上の）(上記コマンドで、originに省略した)に反映
git push origin master
# git push [リモートリポジトリのURL] [差分をリモートリポジトリに反映させたい，ローカルリポジトリにおけるブランチ]
```
<br><br>


もし`fatal: remote origin already exists.`のエラー出たら
```bash
git remote rm origin
```
<br>
`cat .git/config`で登録されたかチェック

`git remote -v`でリモートブランチ名を表示して，originであることを確認

<br><br>

### GitHub上のリポジトリをローカルに落とす
```bash
git clone <URL copied from GitHub> 
```
<br><br>


### 差分表示
```bash
# print working tree status
git status

# ワークツリーとインデックスの差分（変更したファイル名のステータスを表示）
git diff --name-status
# A, add
# M, modify
# D, delete

# ワークツリーとインデックスの差分（ある特定のファイルの）
git diff <ファイル名>

# ワークツリーとインデックスの差分（全てのファイルの）
git diff

# インデックスとHEAD（現在ブランチの最新コミット）との差分
git diff --cached

# ワークツリーとHEAD（現在ブランチの最新コミット）との差分
git diff HEAD

# 指定したコミット間(コミットA：変更前 → コミットB：変更後)の差分
git diff <コミットA> <コミットB> <ファイル名>
# https://tmytokai.github.io/open-ed/activity/git/text02/page06.html
# 過去のコミットの差分見たいなら、$ git show が良いよ（下に詳しく書いてる）
```

ブランチは，履歴の先頭コミット<br>
HEADは，最新のコミットのハッシュ値の別名（エイリアス）<br>
@は，HEADの別名（エイリアス）<br>
HEAD^，HEAD〜，HEAD~1は，HEAD(最新のコミット)から一つ前のコミットという意味<br>
HEAD^^^，HEAD〜3は，HEADから三つ前のコミットという意味<br>
参考：https://prograshi.com/general/git/meaning-of-head-and-at-mark/

### 過去のコミットを確認
```bash
# 過去のコミットのハッシュ値を表示
git log | head

# 過去の2件のコミットのハッシュ値を表示
git log -2
# HEAD -> master
# 現在masterブランチにいて、最新のコミット(HEAD)はこのコミットであることを示しています

# 過去の2件のコミットのハッシュ値を1行ずつ表示
git log -2 --oneline

# 過去の2件のコミットの変更したファイル名を表示
git log -2 --name-status
# A, add
# M, modify
# D, delete
# https://it-ojisan.tokyo/git-log-file-list/


# 過去の2件のコミットの修正内容・差分を詳細に表示
git log -2 -p

# ブランチのコミット表示
git log <ブランチ名>
# git fetch && git log origin/master && git merge origin/master

# ファイルのコミット表示
git log <ファイル名>
# https://atmarkit.itmedia.co.jp/ait/articles/2004/10/news024.html

# ツリー状に過去のコミットを表示
git log --graph --oneline --decorate=full
# https://qiita.com/masarufuruya/items/7480854d4bc2f0443fc1

# <過去のコミットのハッシュ値>のコミットの修正内容・差分表示
git show <過去のコミットのハッシュ値>

# <過去のコミットのハッシュ値>のコミットの時の，<ファイル名>のファイル内容を表示
git show <過去のコミットのハッシュ値>:<ファイル名>

# 最新のコミットの修正内容・差分表示
git show
# = git show HEAD

```
<br><br>

### リモートの差分をローカルに取り込む
```bash
git pull origin master
# リモートリポジトリ(origin)の差分をfetchして，ローカルのmasterブランチにmergeする．
# pull = fetch + merge

git fetch origin
# リモート追跡ブランチ(origin/master)がリモートリポジトリのoriginブランチの差分を取り込む(fetchする)．リモート追跡ブランチは自動的に作られる．

git merge origin/master
# ローカルの上流ブランチ（origin/master）を、現在いるブランチにmergeする．
# ローカルのmasterブランチにマージしたい時は、masterブランチに移動する（$ git checkout master）。
# https://qiita.com/uasi/items/69368c17c79e99aaddbf

# git pull origin master --allow-unrelated-histories
```
<br><br>

### 一時的にファイルを別の場所に保管する（例えば，ブランチをマージする前）
```bash
git stash
# 一時的にカレントディレクトリ以下のファイルを別の場所に保管する（スタッシュ）

git stash -u
# uオプションは，$ git statusで"untracked files"として表示されるファイル(前回のコミットで無かった新規で作成されたファイル)を含むすべてのファイルをスタッシュ

git stash list
# スタッシュされたファイルの一覧を表示
# stash@{0}，stash@{1}．．．は「スタッシュ名」
# 新しいスタッシュがstash@{0}
# WIP は Work In Progress の略で「作業中」の意味
# https://git.keicode.com/how-to-use-git/git-stash.php


# ~~~
# マージする
# ~~~


git stash pop
# スタッシュされたファイルをワーキングツリーに戻す
```
<br><br>

### branch
```bash
# ローカルブランチ名表示; デフォルトのローカルブランチ名:master
git branch
# ＊　がついてるブランチが現在作業しているブランチ

# リモートブランチ名表示; デフォルトのリモートブランチ名:origin
git remote -v

# ローカル+リモートブランチ名表示; 
git branch -a
# "-a" is -all
# ブランチ先頭の"remotes/"はリモートブランチのこと

# リモート追跡ブランチ名(リモート名/ブランチ名)表示; デフォルトのリモート追跡ブランチ名(リモート名/ブランチ名):origin/master
git branch -r

# masterから枝分かれしたブランチhogeを作る（masterブランチを切る）
git branch [hoge]

# 作業するブランチmaster→hogeに変える
git checkout [hoge]

# git branch [hoge] && git checkout [hoge] 
git checkout -b [hoge]

# ＊hogeで,現在作業しているブランチを確認
git branch


# ~~~
# ローカルのhoge上で，何かしらコミットする
# ~~~

# リモートリポジトリ（GitHub）のhogeブランチに反映
git push origin [hoge]

# 作業するブランチhoge→masterに変える
git checkout master

# ＊masterで,現在作業しているブランチを確認
git branch -a

# masterにhogeのコミットした差分を取り込む
git merge [hoge]

# ブランチhogeを消す
git branch -d [hoge]
# -d オプションは，一回はコミットされたブランチを削除
# -D　オプションは，過去にコミットがないブランチを削除

# リモートリポジトリ（GitHub）のhogeブランチを削除
git push --delete origin [hoge]
```
<br><br>


###  元の状態に戻す
```bash
# git checkout の機能
# 1. 作業ブランチを切り替える
# 2. 指定したコミットの状態を、インデックスと作業ツリーに展開する
# 分かりやすいURL→https://www-creators.com/archives/1290
# ワーキングツリーを，インデックス（ステージ）の状態に戻す
git checkout .

#  ワーキングツリーとインデックス（ステージ）を，HEADが指すコミットの状態に戻す
git checkout HEAD .

# ローカルリポジトリのワーキングツリーを、過去のコミットした時の状態に戻す（変更する）．
git reset --hard <過去のコミットのハッシュ値>
# --hardオプションは，ワーキングツリー・インデックス（ステージ）・ローカルリポジトリの全てを戻す
# ページ下の図がまとまっている：https://dev.classmethod.jp/articles/git-reset-and-git-checkout/
# https://qiita.com/shuntaro_tamura/items/db1aef9cf9d78db50ffe
```

<br><br>

### 間違った操作をした場合
```bash
# 操作履歴を確認
git reflog
# https://www.r-staffing.co.jp/engineer/entry/20191227_1

# 間違った操作の前のHEAD@{数字}の状態に戻す
git reset --hard HEAD@{1}
```
<br><br>


### 要注意
```bash
# 強制プッシュ
リモートリポジトリのコミットを削除するので，削除されたコミットは，復元不可．要注意
git push -f origin masters

# リモートリポジトリ（GitHub）のコミットの履歴から、過去のコミットのハッシュ値以降のコミットを削除
git push -f origin <過去のコミットのハッシュ値>:<対象ブランチ名>
```