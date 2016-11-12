# ubuntu + putty

**  download putty-0.67.tar.gz
skip


* decompress
```
tar -xf putty-0.67.tar.gz
``

* make
```
cd putty-0.67
cd unix
./configure && make
```

* create link
```
cd /usr/local/bin/
ln -s /home/lu/softwares/putty-0.67/unix/putty ./putty

```

# just 
```
sudo apt-get install putty
```
then done