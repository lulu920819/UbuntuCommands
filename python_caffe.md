# python + caffe
```
make test 

make runtest 

至此caffe主程序编译完毕。

下面编译pycaffe，至执行

make pycaffe

make distribute

执行完后修改bashrc文件，添加

PYTHONPATH=${HOME}/caffe/python:$PYTHONPATH

使得python能够找到caffe的依赖。

# tesing 
python
import caffe

```
