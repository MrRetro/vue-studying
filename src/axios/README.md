# axios在get请求时手动修改不了请求头部Content-Type

##### 这是一个坑，原因是因为get请求的时候只有请求头,没有请求体,所有手动设置不了Content-Type,如果想要设置请求头部Content-Type的话可以对post请求设置。