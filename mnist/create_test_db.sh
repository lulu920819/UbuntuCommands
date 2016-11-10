#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs
set -e

# EXAMPLE=examples/dcase3
# DATA=data/dcase3
# TOOLS=build/tools


# TRAIN_DATA_ROOT=~/caffe/data/dcase3/train/
# VAL_DATA_ROOT=~/caffe/data/dcase3/val/

LABEL="/home/mmap/lu/DCASE/DCASE2016-baseline-system-python/data/system/label/1"
DATA_ROOT="/home/mmap/lu/DCASE/DCASE2016-baseline-system-python/data/system/images/1/"
DB_PATH=~/caffe/examples/dcase2s_nor
TOOLS=build/tools
# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=false
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

# if [ ! -d "$TRAIN_DATA_ROOT" ]; then
#   echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
#   echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
#        "where the ImageNet training data is stored."
#   exit 1
# fi

# if [ ! -d "$VAL_DATA_ROOT" ]; then
#   echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
#   echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
#        "where the ImageNet validation data is stored."
#   exit 1
# fi

# echo "Creating train lmdb..."

# GLOG_logtostderr=1 $TOOLS/convert_imageset \
#     --resize_height=$RESIZE_HEIGHT \
#     --resize_width=$RESIZE_WIDTH \
#     --shuffle \
#     --gray=true \
#     $DATA_ROOT \
#     $LABEL/train.txt \
#     $DB_PATH/dcase2s_nor_train_lmdb

# echo "Creating val lmdb..."

# GLOG_logtostderr=1 $TOOLS/convert_imageset \
#     --resize_height=$RESIZE_HEIGHT \
#     --resize_width=$RESIZE_WIDTH \
#     --shuffle \
#     --gray=true \
#     $DATA_ROOT \
#     $LABEL/val.txt \
#     $DB_PATH/dcase2s_nor_val_lmdb


echo "Creating test lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    --gray=true \
    $DATA_ROOT \
    $LABEL/test.txt \
    $DB_PATH/dcase2s_nor_test_lmdb


echo "Done."