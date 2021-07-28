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

i b(=info break)ブレイクポイントの情報
```bash
(gdb) i b
```
<br>
```bash
Num     Type           Disp Enb Address            What
3       breakpoint     keep y   0x00005555555668e7 in main(int, char 
```

Numが３のbreakpointを削除
```bash
(gdb) d 3
```
<br>

c(=continue). 次のブレイクポイントまで
```bash
(gdb) c
```
<br>

l(=list)プログラムの表示, 10行
```bash
(gdb) l
```
<br>

whe(=where)現在の停止位置
```bash
(gdb) whe
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

i(=info)現在の全スレッドを確認する
```bash
(cuda-gdb) i cuda threads
```
<br>

i(=info)GPU情報
```bash
(cuda-gdb) i cuda devices
```
<br>

p(=print)
```bash
(cuda-gdb) p 変数名
```
```bash
(cuda-gdb) p &変数名
```
```bash
(cuda-gdb) p costvolume.K_gpu_inv
```
<br>

i lo(= info locals)現在の関数内の局所変数の名前と値を全て表示する。
```bash
(cuda-gdb) i lo
```
<br>

To obtain the current focus, https://on-demand.gputechconf.com/gtc/2014/presentations/S4578-cuda-debugging-command-line-tools.pdf
```bash
(cuda-gdb) cuda thread
```
thread (0,10,0)
<br>

```bash
(cuda-gdb) cuda kernel block thread
```
kernel 0, block (37,29,0), thread (0,10,0