#!/usr/bin/python

import numpy as np
import caffe
import sys
caffe_root='/home/mmap/caffe/'
# you can not use ~/caffe
import os
# if os.path.isfile(caffe_root + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'):
if os.path.isfile(caffe_root + 'examples/dcase2/caffenet_train_iter_45000.caffemodel'):
    print 'CaffeNet found.'
else:
    print 'Downloading pre-trained CaffeNet model...'
    # !../scripts/download_model_binary.py ../models/bvlc_reference_caffenet


caffe.set_device(0)  # if we have multiple GPUs, pick the first one
caffe.set_mode_gpu()
model_def = caffe_root+'examples/dcase2/deploy.prototxt' # deploy
model_weight = caffe_root + 'examples/dcase2/caffenet_train_iter_80000.caffemodel'

net = caffe.Net(model_def, model_weight,caffe.TEST)

# load the mean ImageNet image (as distributed with Caffe) for subtraction
mu = np.load(caffe_root + 'data/dcase2/imagenet_mean.npy')
mu = mu.mean(1).mean(1)  # average over pixels to obtain the mean (BGR) pixel values
print 'mean-subtracted values:', zip('BGR', mu)


# create transformer for the input called 'data'
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})

transformer.set_transpose('data', (2,0,1))  # move image channels to outermost dimension
transformer.set_mean('data', mu)            # subtract the dataset-mean value in each channel
transformer.set_raw_scale('data', 255)      # rescale from [0, 1] to [0, 255]
transformer.set_channel_swap('data', (2,1,0))  # swap channels from RGB to BGR

image = caffe.io.load_image(caffe_root + 'data/dcase2/train/a001_0_30_0.jpg')
transformed_image = transformer.preprocess('data', image)

# copy the image data into the memory allocated for the net
net.blobs['data'].data[...] = transformed_image

### perform classification
output = net.forward()

output_prob = output['prob'][0]  # the output probability vector for the first image in the batch

print 'predicted class is:', output_prob.argmax()