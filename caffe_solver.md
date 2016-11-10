learn caffe solver.prototxt

```
net: "models/bvlc_alexnet/train_val.prototxt" 
test_iter: 1000       # 
test_interval: 1000   # 
base_lr: 0.01         # 开始的学习率
lr_policy: "step"     # 学习率的drop是以gamma在每一次迭代中
gamma: 0.1
stepsize: 100000      # 每stepsize的迭代降低学习率：乘以gamma
display: 20           # 没display次打印显示loss
max_iter: 450000      # train 最大迭代max_iter 
momentum: 0.9         #
weight_decay: 0.0005  #
snapshot: 10000       # 没迭代snapshot次，保存一次快照
snapshot_prefix:   "models/bvlc_reference_caffenet/caffenet_train"
solver_mode: GPU      # 使用的模式是GPU
```

* test_iter
在测试的时候，需要迭代的次数，即test_iter* batchsize（测试集的）=测试集的大小，测试集的 batchsize可以在prototx文件里设置。

* test_interval
训练的时候，每迭代test_interval次就进行一次测试。

* momentum
灵感来自于牛顿第一定律，基本思路是为寻优加入了“惯性”的影响，这样一来，当误差曲面中存在平坦区的时候，SGD可以更快的速度学习。 


```
首先说明一个概念：在caffe中的一次迭代iterration指的是一个batch,而不是一张图片。下面就主要说下2个概念

test_iter: 在测试的时候，需要迭代的次数，即test_iter* batchsize（测试集的）=测试集的大小，测试集batchsize可以在prototx文件里设置

test_interval:interval是区间的意思，所有该参数表示：训练的时候，每迭代500次就进行一次测试。

caffe在训练的过程是边训练边测试的。训练过程中每500次迭代（也就是32000个训练样本参与了计算，batchsize为64），计算一次测试误差。计算一次测试误差就需要包含所有的测试图片（这里为10000），这样可以认为在一个epoch里，训练集中的所有样本都遍历以一遍，但测试集的所有样本至少要遍历一次，至于具体要多少次，也许不是整数次，这就要看代码，大致了解下这个过程就可以了.

```


```
lr_policy设置为step,则学习率的变化规则为 base_lr * gamma ^ (floor(iter / stepsize))

即前1000次迭代，学习率为0.01; 第1001-2000次迭代，学习率为0.001; 第2001-3000次迭代，学习率为0.00001，第3001-3500次迭代，学习率为10-5  

上面的设置只能作为一种指导，它们不能保证在任何情况下都能得到最佳的结果，有时候这种方法甚至不work。如果学习的时候出现diverge（比如，你一开始就发现非常大或者NaN或者inf的loss值或者输出），此时你需要降低base_lr的值（比如，0.001），然后重新训练，这样的过程重复几次直到你找到可以work的base_lr。

```

* epoch
```
这个要与test layer中的batch_size结合起来理解。mnist数据中测试样本总数为10000，一次性执行全部数据效率很低，因此我们将测试数据分成几个批次来执行，每个批次的数量就是batch_size。假设我们设置batch_size为100，则需要迭代100次才能将10000个数据全部执行完。因此test_iter设置为100。执行完一次全部数据，称之为一个epoch

```

```
ration： 数据进行一次前向-后向的训练
batchsize：每次迭代训练图片的数量
epoch：1个epoch就是将所有的训练图像全部通过网络训练一次
例如：假如有1280000张图片，batchsize=256，则1个epoch需要1280000/256=5000次iteration
它的max-iteration=450000，则共有450000/5000=90个epoch
而lr什么时候衰减与stepsize有关，减少多少与gamma有关，即:若stepsize=500, base_lr=0.01, gamma=0.1,则当迭代到第一个500次时，lr第一次衰减，衰减后的lr=lr*gamma=0.01*0.1=0.001,以后重复该过程，所以
stepsize是lr的衰减步长，gamma是lr的衰减系数。
在训练过程中，每到一定的迭代次数都会测试，迭代次数是由test-interval决定的，如test_interval=1000，则训练集每迭代1000次测试一遍网络，而
test_size, test_iter, 和test图片的数量决定了怎样test, test-size决定了test时每次迭代输入图片的数量，test_iter就是test所有的图片的迭代次数，如：500张test图片，test_iter=100，则test_size=5, 而solver文档里只需要根据test图片总数量来设置test_iter，以及根据需要设置test_interval即可。

```
