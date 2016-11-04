# caffe + mnist

[reference bolg](http://www.cnblogs.com/yymn/p/4553671.html)

# steps
* get the data  
download form internet
``` 
./data/mnist/get_mnist.sh
```

* create the dateset
```
./examples/mnist/create_mnist.sh
wrong message

./create_mnist.sh: build/examples/mnist/convert_mnist_data.bin: not found./data/mnist/get_mnist.sh

solution
新版caffe都需要从根目录上执行，不然可能会遇到这个错误：

```


* trian
```
./examples/mnist/train_lenet.sh
运行完结果如下：

生成四个文件

lenet_iter_10000.caffemodel         
lenet_iter_10000.solverstate      
lenet_iter_5000.caffemodel         
lenet_iter_5000.solverstate 
```

* 当所有数据都训练好之后，接下来就是如何将模型应用到实际数据了：
```
如果没有GPU则使用

./build/tools/caffe.bin test -model=examples/mnist/lenet_train_test.prototxt -weights=examples/mnist/lenet_iter_10000.caffemodel
```
