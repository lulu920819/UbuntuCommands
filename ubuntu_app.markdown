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

