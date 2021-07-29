[command]+[alt]+[o]：preview md  

「OmniMarkupPreviewer」というsublime textのプラグイン

# how to use gdb for debugging
参考

* https://uguisu.skr.jp/Windows/gdb.html
<br>
<br>
<br>
<br>

## gdb
ビルドして実行ファイルを生成．-gオプションは，gdb使うために，デバッグ情報を付与．-g3の3は，デバッグレベル．-O0オプションは，最適化をレベル０にして無効（[最適化をするとソースコードに書かれている処理の順番とコンパイル後の処理の順番が変わることがあってデバッグするのむずいから](https://www.clear-code.com/blog/2013/5/8.html)）．
```bash
g++ -std=c++11 -g3 -O0 ソースコード名
```
<br>

gdb を起動する
```bash
gdb 実行ファイル名
```
<br>

b(=break)：ブレイクポイントを貼る．main.cppの72行目
```bash
(gdb) b main.cpp:72
```
<br>

ブレイクポイントを貼る．main.cppの関数の先頭
```bash
(gdb) b main.cpp:関数名
```
<br>

i b(=info break)貼ったブレイクポイントの情報
```bash
(gdb) i b
```
```bash
Num     Type           Disp Enb Address            What
3       breakpoint     keep y   0x00005555555668e7 in main(int, char なんとか
```
<br>

r(=run)：プログラムを走らせる．引数がいるなら，引数もつける
```bash
(gdb) r　引数
```
<br>

c(=continue)：次のブレイクポイントまで進む
```bash
(gdb) c
```
<br>


n(=next)：停止しているプログラムの次の1行を実行する。stepとの違いは関数呼び出しを1行として扱う点である。
```bash
(gdb) n
```
<br>


s(=step)：停止しているプログラムの次の1行を実行する。 nextとの違いは呼び出された関数の行も1行として扱う点である。
```bash
(gdb) s
```
<br>


l(=list)：プログラムの表示, 10行
```bash
(gdb) l
```
<br>

whe(=where)：現在の停止位置
```bash
(gdb) whe
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

d(=delete)：`(gdb) i b`の出力の左端の，Numが３のブレイクポイントを削除
```bash
(gdb) d 3
```
<br>

すべてのブレイクポイントを削除
```bash
(gdb) d
```
<br>

<br>
<br>
<br>
<br>


## cuda-gdb
cuda-gdbはgdbの拡張版．
https://i.riken.jp/wp-content/uploads/2015/06/secure_4467_cuda-programming_main.pdf
の106ページ目
<br>
<br>

cuda-gdbを起動
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

i lo(= info locals)現在の関数内の局所変数の名前と値を全て表示する。
```bash
(cuda-gdb) i lo
```
<br>

[To obtain the current focus](https://on-demand.gputechconf.com/gtc/2014/presentations/S4578-cuda-debugging-command-line-tools.pdf)
```bash
(cuda-gdb) cuda thread
```
`thread (0,10,0)`
<br>

```bash
p threadIdx
```
<br>

cuda-gdbで動かすthreadを`thread (0,10,0)`から`(0,5,0)`に変更
```bash
(cuda-gdb) cuda thread 0,5,0
```
<br>

```bash
(cuda-gdb) cuda kernel block thread
```
kernel 0, block (37,29,0), thread (0,10,0)