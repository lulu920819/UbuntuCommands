# caffe datum 

# datum
caffe.proto中对Datum类的定义如下。data和float_data分别保存字节型和浮点型的数据，channels,height,width描述了数据的维度与形状。

  	  message Datum {
      optional int32 channels = 1;
      optional int32 height = 2;
      optional int32 width = 3;
      // the actual image data, in bytes
      optional bytes data = 4;
      optional int32 label = 5;
      // Optionally, the datum could also hold float data.
      repeated float float_data = 6;
      // If true data contains an encoded image that need to be decoded
      optional bool encoded = 7 [default = false];
    }


# how to transform
因为提取的特征向量是实数，所以我们从'float_data'
属性中获取数据。repeated类型的'float_data'在Python中作为一个list处理，所以可以用列表推导式(list comprehension)进行操作。数据的输出格式根据实际需要定义就好，关键是能获取到原始数据。这里我们把每个向量转换成一个字符串，相邻两维之间用空格分隔。

	

  把'float_data'中的所有项转换成字符串，以空格分隔连接起来
  data_str = ' '.join([str(dim) for dim in datum.float_data]) + "\n"


  ```
  3：包含repeated的字段

我是这么做的：

[html] view plain copy
print?在CODE上查看代码片派生到我的代码片

    imageAndTexts = organize.imageAndTexts  
    for data in datas:  
      imageAndText = imageAndTexts.add()  
      convertDataToImageAndText(data, imageAndtext)  


[python] view plain copy
print?在CODE上查看代码片派生到我的代码片

    def convertDataToImageAndText(data, it):  
      it.image = data.image  
      it.text = data.text  
```
