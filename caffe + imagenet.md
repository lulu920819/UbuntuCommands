# caffe + imagenet

all the command run in the caffe root folder

#prepate dataset

in the dacase data folder
* transform wav to images

```
python Wav2Images.py

```

the images is under the images/

* make labels just for the cnn

split the fold_x_train.txt into train and val set, 9:1 

```
python makelabels.py
```
the labels are under the labels/1 or 2 or 3 or 4

* convert the file into 256*256
```
sudo apt-get install imagemagick

# convert256.sh

for name in images_spectrogram/*.jpg
do
convert -resize 256x256\! $name $name
done

```

# move files
make sure mkdir under the caffe/data/dcase1

sturcture are like : 

```
dcase1
|--train/
|----train.jpg
|--val/
|----val.jpg
|--train.txt
|--val.txt
```

copy files
```
cp labels/1/* ~/caffe/data/dcase1/
cp images/* ~/caffe/data/dcase1/train/
cp images/* ~/caffe/data/dcase1/val/
```

# make leveldb

* mkdir under the caffe/examples/
	for example caffe/examples/dcase1

* copy examples/imagenet/create_imagenet.sh into the example/dcase1/

* change the file create_imagenet.sh according to your data

```
EXAMPLE=examples/dcase1  # location you want to store the database
DATA=data/dcase1  # location of the images you move 
TOOLS=build/tools

# the  location you store the images
TRAIN_DATA_ROOT=~/caffe/data/dcase1/train/ 
VAL_DATA_ROOT=~/caffe/data/dcase1/val/

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/train.txt \
    $EXAMPLE/dcase1_train_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $VAL_DATA_ROOT \
    $DATA/val.txt \
    $EXAMPLE/dcase1_val_lmdb

#  can change the $EXAMPLE/dcase1_val_lmdb $EXAMPLE/dcase1_train_lmdb
#  it is the name of the database

```

* RUN
```
chmox +x create_imagenet.sh 
 ./examples/dcase1/create_imagenet.sh 
```


# compute the mean of the train set
* copy the ./examples/imagenet/make_imagenet_mean.sh into /examples/dcase1

* CHANGE FILE

```
EXAMPLE=examples/dcase1
DATA=data/dcase1
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/dcase1_train_lmdb \
  $DATA/imagenet_mean.binaryproto

echo "Done."

#  $DATA/imagenet_mean.binaryproto is where the result store 
```

* RUN

```
chmod +x ./examples/dcase1/make_imagenet_mean.sh
./examples/dcase1/make_imagenet_mean.sh
```


# the net proto type

* all copy from the models/bvlc_reference_caffenet/ into the examples/dcase1/

* train_val.prototxt
```
mean_file: "data/dcase1/imagenet_mean.binaryproto"

data_param {
	source: "examples/dcase1/dcase1_train_lmdb"
	batch_size: 256
	backend: LMDB
}

# test layer--batch_size: 50 #和solver中的test_iter相乘约等于验证集大小  
# ALL THE PATH
```

* solver.prototxt
```
net: "examples/dcase1/train_val.prototxt"
test_iter# should change according to batch_size in the train_val.prototxt 
snapshot_prefix: "examples/dcase1/caffenet_train"
solver_mode: GPU
```

# RUN TRAIN
* copy from examples/imagenet/train_imagenet.sh  to examples/dcase1/

* change
```
./build/tools/caffe train \
    --solver=examples/dcase1/solver.prototxt $@
```

* run
```
chmod +x examples/dcase1/train_imagenet.sh
./examples/dcase1/train_imagenet.sh


# or nohup
nohup ./examples/dcase1/train_imagenet.sh > examples/dcase1/log.txt 2>&1 &
# ps don't add log in the examples/dcase1/log/log.txt  dont't know why it will end
```
