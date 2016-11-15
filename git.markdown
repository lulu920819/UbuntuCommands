#配置使用git仓库的人员姓名  
git config --global user.name "Your Name Comes Here"  
  
#配置使用git仓库的人员email  
git config --global user.email you@yourdomain.example.com  

# change the remote

* change the .git/config file derectly

* rm and add
```
git remote rm origin 
git remote add origin git@github.com:Liutos/foobar.git 

```

* change 
``` 
git remote origin set-url URL 
```

# git ssh
```
…or create a new repository on the command line

echo "# PrepareDateCNN" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:lulu920819/PrepareDateCNN.git
git push -u origin master

…or push an existing repository from the command line

git remote add origin git@github.com:lulu920819/PrepareDateCNN.git
git push -u origin master

```


# git http

```
…or create a new repository on the command line

echo "# PrepareDateCNN" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/lulu920819/PrepareDateCNN.git
git push -u origin master

…or push an existing repository from the command line

git remote add origin https://github.com/lulu920819/PrepareDateCNN.git
git push -u origin master
```

# git ignore
```
# 忽略*.o和*.a文件

 *.[oa]

# 忽略*.b和*.B文件，my.b除外

*.[bB]

!my.b

# 忽略dbg文件和dbg目录

dbg

# 只忽略dbg目录，不忽略dbg文件

dbg/

# 只忽略dbg文件，不忽略dbg目录

dbg

!dbg/

# 只忽略当前目录下的dbg文件和目录，子目录的dbg不在忽略范围内

/dbg
```

# update git ingore

```
git rm -r --cached .
# . represent all the files can be replaced by any file name
git add .
git commit -m 'update .gitignore'
```
原因是.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。那么解决方法就是先把本地缓存删除（改变成未track状态）



# 删除本地分支

	git branch -d branchname


# remove password



    touch .git-credentials
    vim .git-credentials
    https://{username}:{password}@github.com

	git config --global credential.helper store