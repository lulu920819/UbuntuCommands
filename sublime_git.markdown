# sublime + git
## fatal: could not read Username for 'https://github.com': No such file or directo

原因使用https方式的时候 在git remote add origin 的https url 里面没有用户名和密码

修改为如下：

git remote add origin https://{username}:{password}@github.com/{username}/project.git

https://github.com/kemayo/sublime-text-git/issues/176

或者直接修改 .git/config 隐藏文件 为git remote add origin https://{username}:{password}@github.com/{username}/project.g