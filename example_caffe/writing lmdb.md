# writing lmdb using python

```
import numpy as np
import lmdb
import caffe

# process 1000 samples every time
N = 1000

# Let's pretend this is interesting data
X = np.zeros((N, 3, 32, 32), dtype=np.uint8)
y = np.zeros(N, dtype=np.int64)

# We need to prepare the database for the size. We'll set it 10 times
# greater than what we theoretically need. There is little drawback to
# setting this too big. If you still run into problem after raising
# this, you might want to try saving fewer entries in a single
# transaction.
map_size = X.nbytes * 10

env = lmdb.open('mylmdb', map_size=map_size)

with env.begin(write=True) as txn:
    # txn is a Transaction object
    for i in range(N):
        datum = caffe.proto.caffe_pb2.Datum()
        # X.shape[0] is N i guess
        datum.channels = X.shape[1]	# 3
        datum.height = X.shape[2] 	# 32
        datum.width = X.shape[3]	# 32
        datum.data = X[i].tobytes()  # or .tostring() if numpy < 1.9
        datum.label = int(y[i])
        str_id = '{:08}'.format(i)

```


# example Two
[links](http://blog.csdn.net/u010668907/article/details/51834411#)

```
import numpy as np  
import lmdb  
import Image as img  
from skimage import io  
import sys,os  
sys.path.insert(0, '../../python')  
import caffe  
import argparse  
import random  
  
def load_txt(txt, shuffle):  
    if txt == None:  
        print "txtpath!!!"  
        exit(0)  
    if not os.path.exists(txt):  
         print "the txt is't exists"  
         exit(0)  
    flag = 0  
    file_content = []  
    txt_file = open(txt, 'r')  
    for line in open(txt, 'r'):  
        line = txt_file.readline()  
        list = line.split()  
        file_content.append([list[0], list[1], list[2]])  
        flag += 1   
    if not shuffle == None:<span style="font-family: Arial, Helvetica, sans-serif;">#为了打乱数据顺序</span>  
        random.shuffle(file_content)  
    return file_content  
  
def add_argu(parse):  
    parse.add_argument('--txt')  
    parse.add_argument('--lmdb')  
    parse.add_argument('--shuffle')#为了打乱数据顺序  
    parse.add_argument('--picpath')  
    return parse.parse_args()   
  
if __name__ == '__main__':  
    parse = argparse.ArgumentParser()  
    args = add_argu(parse)  
  
    content = []    
    content = load_txt(args.txt, args.shuffle)#加载图片名字和label  
    print 'total: ', len(content)  
    env = lmdb.Environment(args.lmdb, map_size=int(1e12))  
      
    with env.begin(write=True) as txn:  
        # txn is a Transaction object  
        for i in range(len(content)):  
            datum = caffe.proto.caffe_pb2.Datum()  
            pic_path1 = args.picpath + '/' +  content[i][0]  
            pic_path2 = args.picpath + '/' + content[i][1]  
            label = int(content[i][2])  
            img_file1 = io.imread(pic_path1)  
            img_file2 = io.imread(pic_path2)  
            datum.channels = 2#channels  
            datum.height = img_file1.shape[0]#height  
            datum.width = img_file1.shape[1]#width  
            data = np.zeros((2,  img_file1.shape[0],  img_file2.shape[1]), dtype=np.uint8)#初始化data  
            data[0] = img_file1  
            data[1] = img_file2  
            datum.data = data.tostring() #data  
            datum.label = int(label)#label  
            str_id = "%08d" %(i) + "_" + content[i][0] #'{:08}'.format(i)   #顺序+图片名字作为key  
              
            # The encode is only essential in Python 3  
            txn.put(str_id.encode('ascii'), datum.SerializeToString())  
```