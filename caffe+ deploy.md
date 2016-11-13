# caffe deploy 
just a little different from the train_val.prototxt

# input
```
layer {
  name: "data"
  type: "Input"
  top: "data"
  input_param { shape: { dim: 10 dim: 3 dim: 227 dim: 227 } }
}

# no meanfile
```

# structure

just remove below in the conv and InnerProduct

reserve the relu and drop out
```
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }

      weight_filler {
      type: "gaussian"
      std: 0.01
    }
    bias_filler {
      type: "constant"
      value: 0
    }
``` 


# output
```
layer {
  name: "prob"
  type: "Softmax"
  bottom: "fc8"
  top: "prob"
}

```