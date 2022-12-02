# version: 1.0.0

FROM ubuntu:20.04

MAINTAINER MNicholas "xiankong@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV GOINSECURE="*.smarteye.com" GOPRIVATE="*.smarteye.com" GOPROXY="https://goproxy.cn,direct"

RUN mkdir /root/env root/workspace && cd /root/env \
    && apt update -y \
    && apt install -y gcc g++ automake autoconf make cmake wget vim git

RUN apt install -y python3 subversion

# golang
RUN cd /root/env \
    && wget "https://golang.google.cn/dl/go1.19.3.linux-amd64.tar.gz" \
    && tar -zxvf go1.19.3.linux-amd64.tar.gz \
    && rm -f go1.19.3.linux-amd64.tar.gz \
    && sed -i '$aexport PATH=$PATH:~/env/go/bin' /root/.bashrc

# config
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && git config --global http.sslverify false \
    && git config --global credential.helper store \
    && git config --global --add core.filemode false


WORKDIR /root/workspace

VOLUME /root/workspace

EXPOSE 9000

CMD ["/usr/bin/bash"]

