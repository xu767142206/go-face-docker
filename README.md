# go-face库的docker环境（目前只有dlib）
## 1、docker build -t go-face/ubuntu:22.04 .
## 2、docker run -d --name go-face --restart=always -v /f/xycgo/src/face:/go/src -it go-face/ubuntu:22.04
如果进入容器 提示没有gcc的话 再次##apt install build-essential

