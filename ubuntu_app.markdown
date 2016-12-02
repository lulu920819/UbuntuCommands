# xclip
copy the content of a file into the clipboard 

```
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_ras.pub
```


# shutter
截图
	
	sudo apt-get install shutter


# diodon

剪贴板

	sudo apt-add-repository ppa:diodon-team/stable
	sudo apt-get update
	sudo apt-get install diodon
	# and for all Unity users there is also a scope
	sudo apt-get install unity-scope-diodon

# xmind
思维导图

	XMind（思维导图）
	官方下载：http://www.xmind.net/download/linux/
	chmod +x setup.sh
	sudo ./setup.sh
	cd  XMind_i386/ 
	双击XMIND


# todo
真的要解决，可以看代码github
	git clone git://github.com/keithfancher/Todo-Indicator.git
	python setup.py
	# maybe need
	sudo apt-get install --reinstall python-gi
	sudo apt-get install python-gi
	pip install pyinotify
	python-gi

	export PYTHONPATH = "PYTHONPATH:/usr/lib/python2.7/dist-packages"
	# run


# STICKYNOTES
便签
	sudo add-apt-repository ppa:umang/indicator-stickynotes

	sudo apt-get update

	sudo apt-get install indicator-stickynotes

# mendelay
	paper management software

[download](https://www.mendeley.com/newsfeed/)


# vim

[reference](https://github.com/ma6174/vim)

# sogou

[reference](http://pinyin.sogou.com/linux/?r=pinyin%E3%80%82)
	remember to log out


# cmatrix
	sudo apt-get install cmatrix
	cmatrix


# guake terminal
	sudo apt-get install guake
[reference](https://github.com/Guake/guake)

# tweak tools
change the desktop
	sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
	sudo apt-get update
	duso apt-get install unity-tweak-tool

# guake
	sudo add-apt-repository ppa:webupd8team/unstable
	sudo apt-get update

# 下载
	http://jingyan.baidu.com/article/a65957f4e9adcf24e67f9bc0.html?st=2&net_type=&bd_page_type=1&os=0&rst=

# zsh
	sudo apt-get install zsh
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	chsh?? and logout

#  词典
	sudo apt-get install stardict
	tar -zxvf  *.tar.bz2	
	sudo cp -rf /home/who/down/* /usr/share/stardict/dic
	cd /usr/share/stardict/
	sudo chmod -R 777 dic

[字典下载](http://abloz.com/huzheng/stardict-dic/zh_CN/)






















