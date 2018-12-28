# 将路由侠运行在linux docker上，非常适合群晖广域网访问

## 快速上手

pull镜像到本地

`sudo docker pull johnshine/lyx-crossover-vnc:latest`

启动镜像，就会在5901端口开启vnc远程连接端口。第一个5901是VNC连接的端口，你可以改成其它数字，如果冲突的话

`sudo docker run -d -p 5901:5901 johnshine/lyx-crossover-vnc:latest`

或者，你也可以指定vnc远程连接的密码方式启动

`sudo docker run -d -p 5901:5901 -e vnc_password=your_password johnshine/lyx-crossover-vnc:latest`

还可以绑定默认下载目录到host的某个目录，会自动创建一个

`sudo docker run -d -p 5901:5901 -v /path/to/download/folder:/mnt/drive_d johnshine/lyx-crossover-vnc:latest`

使用VNC客户端连接5901端口即可

## VNC客户端推荐

1. [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/windows/)
2. [jump desktop](https://jumpdesktop.com/)
3. [TightVNC](https://github.com/TigerVNC/tigervnc/releases)
