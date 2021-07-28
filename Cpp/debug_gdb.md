# how to use gdb for debugging
https://uguisu.skr.jp/Windows/gdb.html

## gdb
実行ファイルをビルドして作成．-gオプションは，gdb使うために，デバッグ情報を付与．
```bash
g++ -std=c++11 -g3 ソースコード名
```
<br>

gdb を起動する
```bash
gdb 実行ファイル名
```
<br>

r(=run)：プログラムを走らせる．引数がいるなら，引数もつける
```bash
(gdb) r　引数
```
<br>

b(=break)：ブレイクポイントを貼る．main.cppの72行目
```bash
(gdb) b main.cpp:72
```
<br>

b(=break)ブレイクポイントを貼る．main.cppの関数の先頭
```bash
(gdb) b main.cpp:関数名
```
<br>

ブレイクポイントの情報
```bash
(gdb) info break
```
<br>

c(=continue). 次のブレイクポイントまで
```bash
(gdb) c
```
<br>

プログラムの表示
```bash
(gdb) list
```
<br>

d(=delete)ブレイクポイントを消す
```bash
(gdb) d main.cpp:72
```
<br>

d(=delete)ブレイクポイントを消す
```bash
(gdb) delete
```
<br>

## cuda-gdb
create exec file
```bash
g++ -std=c++11 -g3 -G ソースコード名
```
<br>

```bash
cuda-gdb 実行ファイル名
```
<br>

ブレイクポイントを貼る(b=break)
```bash
(cuda-gdb) b main
```
<br>

```bash
(cuda-gdb) b カーネル関数名
```
<br>

affineConvertOnCuda.cuの73行目にブレイクポイント
```bash
(cuda-gdb) b affineConvertOnCuda.cu :73
```
<br>

現在の全スレッドを確認する
```bash
(cuda-gdb) info cuda threads
```
<br>

```bash
(cuda-gdb) print 変数名
```
<br>
