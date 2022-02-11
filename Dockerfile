
FROM ubuntu:18.04
 
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

ENV TZ=Asia/Shanghai

RUN apt-get update -y \
    && apt-get install -y libdlib-dev libopenblas-dev libjpeg-turbo8-dev \
    && apt-get install -y pkg-config lxc-dev
    # && apt-get install -y pkg-config lxc-dev \
    # && add-apt-repository ppa:kagamih/dlib \
    # && apt-get install -y libdlib-dev libjpeg-turbo8-dev
COPY dlib-1.pc /usr/local/lib/pkgconfig/
RUN apt-get install -y wget git gcc

RUN wget -P /tmp https://dl.google.com/go/go1.16.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go1.16.linux-amd64.tar.gz
RUN rm /tmp/go1.16.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR $GOPATH