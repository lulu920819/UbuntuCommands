# ubuntu + ftp

```
sudo apt-get update
sudo apt-get install vsftpd


sudo service vsftpd restart

```


```
新建"/home/uftp"目录作为用户主目录

打开"终端窗口"，输入"sudo mkdir /home/uftp"-->回车-->输入"sudo ls /home"-->回车-->有一个uftp目录，目录新建成功。
```

```
打开"终端窗口"，输入"sudo useradd -d /home/uftp -s /bin/bash uftp"-->回车-->用户新建成功-->输入"sudo passwd uftp"设置uftp用户的密码-->回车-->输入两次密码-->回车-->密码设置成功。

```


```
使用gedit修改配置文件/etc/vsftpd.conf

打开"终端窗口"，输入"sudo gedit /etc/vsftpd.conf"-->回车-->打开了vsftpd.conf文件，向文件中添加"userlist_deny=NO

userlist_enable=YES userlist_file=/etc/allowed_users"和"seccomp_sandbox=NO"-->使文件中的"local_enable=YES"-->保存。

```


```
使用gedit新建/etc/allowed_users文件

打开"终端窗口"，输入"sudo gedit /etc/allowed_users"-->回车-->输入uftp-->保存， 文件创建成功。

```


```
使用gedit查看/etc/ftpusers文件中的内容

打开"终端窗口"，输入"sudo gedit /etc/ftpusers"-->回车-->打开这个文件后，看一看有没有uftp这个用户名，如果没有，就直接退出。如果有就删除uftp,因为这个文件中记录的是不能访问FTP服务器的用户清单。

```