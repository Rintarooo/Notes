[command]+[alt]+[o]
preview md

# Git command
sourcetree is GUI version


## 流れ

1. __add__：working tree→index(=stage)

2. __commit__：index→local repository

3. __push__：local repository→remote repository(GitHub))<br><br>


## Git command
<br>
```bash
# カレントディレクトリをgitで管理し始める. 
git init
# 隠しファイルの`.git`が生成される．
```
<br><br><br>

```bash
# ワーキングツリーの変更をインデックスに反映
git add . 
git add [ファイル名]
# `git add [ファイル名]` は単一のファイルのみ, `git add .` は全てのファイル
```
<br><br><br>

```bash
# インデックスの変更をローカルリポジトリに反映
git commit -m [コメント]
```
<br>
前回のコミットを消して，インデックスの変更をローカルリポジトリに反映
```bash
git commit --amend -m [コメント]
```
<br><br>

リモートリポジトリ（GitHub上のリポジトリ）のパス（URL）をoriginに省略する
```bash
git remote add origin [URL copied from GitHub]
```
<br><br>

ローカルリポジトリの変更をリモートリポジトリ（GitHub）に反映
```bash
git push origin masters
git push [URL] masters
```
<br><br>


もし`fatal: remote origin already exists.`のエラー出たら
```bash
git remote rm origin
```
<br>
`vim .git/config`で登録されたかチェック
`git remote -v`でリモートブランチ名表示して，originであることを確認

<br><br>





### 表示
```bash
# print working tree status
git status

# ワークツリーとインデックスの差分
git diff 

# インデックスとHEAD（現在ブランチの最新コミット）との差分
git diff —-cached

# ワークツリーとHEAD（現在ブランチの最新コミット）との差分
git diff HEAD

```
HEAD＾，HEAD〜はHEADから一つ前のコミットという意味<br>
ブランチ=履歴の先頭コミット<br>
HEAD=最新のコミットのハッシュ値のエイリアス
<br>

```bash
#  — 過去のコミットのハッシュ値を確認
git log | head

# 過去の2件のコミットのハッシュ値を確認
git log -2

# 修正内容・差分表示
git log -p

# GitHub上のリポジトリをローカルに落とす
git clone <URL fetched from GitHub> 
```

```bash
git pull origin master --allow-unrelated-histories
# pull = fetch + merge
# fetch: リモート追跡ブランチ(上流ブランチ(リモート)の内容を取り込むために，自動的に作られる)
```
### branch
```bash
# ローカルブランチ名表示; デフォルトのローカルブランチ名:master
git branch
# ＊　がついてるブランチが現在作業しているブランチ

# ローカル+リモートブランチ名表示; 
git branch -a
# "-a" is -all
# "remotes"はリモート追跡ブランチのこと

# リモートブランチ名表示; デフォルトのリモートブランチ名:origin
git remote -v

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
# hoge上で，何かしらコミットする
# ~~~

# リモートリポジトリ（GitHub）のhogeブランチに反映
git push origin [hoge]

# 作業するブランチhoge→masterに変える
git checkout master

# ＊masterで,現在作業しているブランチを確認
git branch

# masterにhogeのコミットした差分を取り込む
git merge [hoge]

# ブランチhogeを消す
git branch -d [hoge]
# -d オプションは，一回はコミットされたブランチを削除
# -D　オプションは，過去にコミットがないブランチを削除
```

```bash
# リモートリポジトリ（GitHub）のhogeブランチを削除
git push --delete origin [hoge]

```

```bash
git reset --hard 昔のコミットのハッシュ値
```

昔のコミットした時の状態に戻す．https://qiita.com/shuntaro_tamura/items/db1aef9cf9d78db50ffe
<br>

```bash
git reflog
```
https://www.r-staffing.co.jp/engineer/entry/20191227_1
<br>

```bash
git reset --hard HEAD@{1}
```
最新の状態に戻す
<br>



```bash
# 強制プッシュ
git push -f origin masters
```