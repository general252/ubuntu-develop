#### golang 开发环境

```
ubuntu20.04
golang 1.19.3 linux amd64
gcc g++
```


build
```
docker build -t registry.cn-hangzhou.aliyuncs.com/octuc/server-e:1.0.0 .
```

run
```
docker run -itd \
        --name=server-develop \
        --dns 114.114.114.114 \
        -v $PWD:/root/workspace \
        registry.cn-hangzhou.aliyuncs.com/octuc/server-e:1.0.0 bash
```

checkout
```
svn checkout http://192.168.6.100/svn/windows/branches/***/mbedtls --username tina
git clone https://github.com/nginx/nginx.git
```

