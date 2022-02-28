FROM ubuntu:22.04
 
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

ENV TZ=Asia/Shanghai

RUN apt-get update -y \
    && apt-get install -y libdlib-dev libblas-dev libatlas-base-dev liblapack-dev libjpeg-turbo8-dev build-essential \
    && apt-get install -y pkg-config lxc-dev

RUN wget -P /tmp https://dl.google.com/go/go1.16.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go1.16.linux-amd64.tar.gz
RUN rm /tmp/go1.16.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR $GOPATH
