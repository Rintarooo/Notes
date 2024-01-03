# Git command

## 流れ

| 順番 | gitのコマンド | 差分の追加 |
|------|---------|------|
| 1    | add     | working tree → index (= stage) |
| 2    | commit  | index → local repository |
| 3    | push    | local repository → remote repository (= GitHub) |


## 基本操作

```bash
# カレントディレクトリ以下をgitでバージョン管理し始める. 
git init
# カレントディレクトリに隠しディレクトリの`.git/`が生成される．
# この.gitディレクトリが、Gitのリポジトリの実体．リポジトリとは，Gitがファイルの履歴を保存している場所のこと．ローカルの環境にあるので，ローカリリポジトリになる．
```
<br><br>

```bash
# ワーキングツリーの差分（＝変更）をインデックスに反映
git add [ファイル名]
# `git add [ファイル名]` は単一のファイルのみ

git add -A
# `git add .`はカレントディレクトリ以下、`git add -A` はリポジトリにおける全てのファイル
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
# mainブランチにおけるローカルリポジトリの差分をリモートリポジトリ（GitHub上の）(上記コマンドで、originに省略した)に反映
git push origin main
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
# HEAD -> main
# 現在mainブランチにいて、最新のコミット(HEAD)はこのコミットであることを示しています

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
# git fetch && git log origin/main && git merge origin/main

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

## リモートの差分をローカルのブランチに取り込む
```bash
# リモートリポジトリ（=GitHub）(リモートブランチ名:origin)の差分をfetchして，ローカルのmainブランチにmergeする．
# pull = fetch + merge
git pull origin main

# リモート追跡ブランチ(origin/main)が、リモートリポジトリ(origin)の差分を取り込む(fetchする)．リモート追跡ブランチは自動的に作られる．
git fetch origin

# ローカルの上流ブランチ（origin/main）を、現在いるブランチにmergeする．
# mainブランチに移動してから（$ git checkout main）、ローカルのmainブランチにマージする。
# https://qiita.com/uasi/items/69368c17c79e99aaddbf
git merge origin/main

```
<br><br>

## rebase
* コミット履歴を時系列順ではなく、マージしたいコミットを、コミット履歴の先頭に持ってくる（ブランチの枝分かれし始めるコミットを変更する）

```bash
git rebase [マージしたいブランチ名]
# https://backlog.com/ja/git-tutorial/stepup/13/

### コンフリクト発生

# コンフリクトを修正後
git add -A
git rebase --continue
```
<br><br>

* コミット履歴をまとめる
```bash
git rebase -i [コミットのハッシュ値]
# https://qiita.com/sugurutakahashi12345/items/5e63bc46a1ff3f2cce5c

# コミットID_1 を指定
git rebase -i コミットID_1

# コミットメッセージを修正する場合
# コミットID_2 に コミットID_3 と コミットID_4 をまとめる
r コミットID_2 コミットメッセージ_2
f コミットID_3 コミットメッセージ_3
f コミットID_4 コミットメッセージ_4

# コミットメッセージ修正しない場合は、rをpに置き換える
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
```
<br><br>


## stash
* 一時的にファイルの変更箇所を別の場所に退避する（例えば，ブランチをマージする前）
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

# スタッシュされたファイルをワーキングツリーに戻す
git stash pop

# stash@{0}をワーキングツリーに戻す
git stash pop stash@{0}
```
<br><br>

### branch
```bash
# ローカルブランチ名表示; デフォルトのローカルブランチ名:main
git branch
# ＊　がついてるブランチが現在作業しているブランチ

# リモートブランチ名表示; デフォルトのリモートブランチ名:origin
git remote -v

# ローカル+リモートブランチ名表示; 
git branch -a
# "-a" is -all
# ブランチ先頭の"remotes/"はリモートブランチのこと

# リモート追跡ブランチ名(リモート名/ブランチ名)表示; デフォルトのリモート追跡ブランチ名(リモート名/ブランチ名):origin/main
git branch -r

# mainから枝分かれしたブランチhogeを作る（mainブランチを切る）
git branch [hoge]

# 作業するブランチmain→hogeに変える
git checkout [hoge]

# git branch [hoge] && git checkout [hoge] 
git checkout -b [hoge]

# リモートリポジトリの[hogehoge]ブランチと同じコミット履歴を持つ[hoge]ブランチを作成して、checkoutで移動する。
git checkout -b [hoge] リモート名/[hogehoge]

# ＊ hogeで,現在作業しているブランチを確認
git branch


# ~~~
# ローカルのhoge上で，何かしらコミットする
# ~~~

# リモートリポジトリ（GitHub）のhogeブランチに反映
git push origin [hoge]

# 作業するブランチをhoge→mainに変える
git checkout main

# ＊　mainで,現在作業しているブランチを確認
git branch -a

# mainにhogeブランチのコミットを取り込む
git merge [hoge]

# ブランチhogeを消す
git branch -d [hoge]
# -d オプションは，一回はコミットされたブランチを削除
# -D　オプションは，過去にコミットがないブランチを削除

# 現在いるブランチ名を、[変更後のブランチ名]に変更
git branch -m [変更後のブランチ名]

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

# ワーキングツリーのカレントディレクトリ以下の全てのファイルを，現時点でのインデックス（ステージ）の状態（git addされてる状態）に戻す
git checkout .

# ワーキングツリーの特定のファイルを，インデックス（ステージ）の状態に戻す
git checkout [hoge]

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
# リモートリポジトリのコミットを書き換えるので，削除されたコミットは復元不可．要注意
# 自分がいじるブランチのみ
git push -f origin main

# リモートリポジトリ（GitHub）のコミットの履歴から、過去のコミットのハッシュ値以降のコミットを削除
git push -f origin <過去のコミットのハッシュ値>:<対象ブランチ名>
```