# shell

1、将当前目录下包含jack串的文件中，jack字符串替换为tom
```

sed -i "s/jack/tom/g" `grep "jack" -rl ./`
```
2、将某个文件中的jack字符串替换为tom
```
sed -i "s/jack/tom/g" test.txt
```

* practice

```
# replace.sh
#!/usr/bin/env sh
#1、将当前目录下包含dcase3串的文件中，dcase3字符串替换为dcase3

sed -i "s/dcase3/dcase5/g" `grep "dcase3" -rl dcase2`
```
```
explanation
#其实就是一个sed 命令  ：  sed -i "s/oldstring/newstring/g" "包含oldstring的文件"

 -i 在文件中直接替换，而不是输出到终端
 
  "s/oldstring/newstring/g"  替换字符串的语法，后面的g表示替换所有的

# 而其中包含oldstring的文件是同过 grep "oldstring" -rl  path 这条命令找出来的
                 -r：在目录中递归查找
 
                -l: 输出找到包含oldstring 的文件名

```