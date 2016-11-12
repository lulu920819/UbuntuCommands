# jupyter + services

jupyter notebook在服务器上的部署

[reference](http://blog.csdn.net/sa14023053/article/details/51725580)

## 安装Anaconda

skip

test:
```
python -V
Python 2.7.11 :: Anaconda custom (64-bit)
```

## openssl
使用openssl生成验证文件
```
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
```
设置过程中要输入国家，地区，机构，邮箱等信息，记住mycert.pem位置
    1
![openssl](images/jupyter1.png)

## 设置密码
```
In [1]: from IPython.lib import passwd
In [2]: passwd()
Enter password: 
Verify password: 
Out[2]: 'sha1:7467b7351f12:79fc65998**************3003b87f3'
```
remember the sha1


'sha1:8552b89b7bd4:9c92f718d0eac497d67a3082625cdfedf6b0b0be'
## 生成配置文件

```
jupyter notebook --generate-config

```
以上将会在 ~/.jupyter/ 下创建默认config 文件: jupyter_notebook_config.py


```
# or 
ipython profile create caffe
```

## 修改配置文件
在 ~/.jupyter/ 下 jupyter_notebook_config.py里添加如下内容
```
# Configuration file for jupyter-notebook.
c = get_config()

# Kernel config
c.IPKernelApp.pylab = 'inline'

# Notebook config
c.NotebookApp.certfile = u'/home/mmap/lu/mycert.pem'#你自己的mycert.pem位置
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:8552b89b7bd4:9******3082625cdfedf6b0b0be'
# It is a good idea to put it on a known, fixed port
c.NotebookApp.port = 7777
```

## login in
server
```
ipython notebook --profile=caffe
# remember it will change port 
```

remote
```
远程登录Jupyter notebook

https://[ip]:[port]9999

```

## log out
```
ctrl + c
```

## ps
in the reference blog
```
.htaccess
iptable
```
don't know what it is but it works 



## kill port
```
kill -9 `lsof -ti:8888`
```

## linux port
```
1. 可以通过"netstat -anp" 来查看哪些端口被打开。
（注：加参数'-n'会将应用程序转为端口显示，即数字格式的地址，如：nfs->2049, ftp->21，因此可以开启两个终端，一一对应一下程序所对应的端口号）
2. 然后可以通过"lsof -i:$PORT"查看应用该端口的程序（$PORT指对应的端口号）。或者你也可以查看文件/etc/services，从里面可以找出端口所对应的服务。
（注：有些端口通过netstat查不出来，更可靠的方法是"sudo nmap -sT -O localhost"）
3. 若要关闭某个端口，则可以：
1)通过iptables工具将该端口禁掉，如：
"sudo iptables -A INPUT -p tcp --dport $PORT -j DROP"
"sudo iptables -A OUTPUT -p tcp --dport $PORT -j DROP"   
2)或者关掉对应的应用程序，则端口就自然关闭了，如：
"kill -9 PID" (PID：进程号)
如：    通过"netstat -anp | grep ssh"
有显示：    tcp 0 127.0.0.1:2121 0.0.0.0:* LISTEN 7546/ssh
则：    "kill -9 7546"

（可通过"chkconfig"查看系统服务的开启状态）

```