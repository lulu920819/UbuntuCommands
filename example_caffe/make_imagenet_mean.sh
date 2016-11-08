#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=examples/dcase3
DATA=data/dcase3
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/dcase3_train_lmdb \
  $DATA/imagenet_mean.binaryproto

echo "Done."
