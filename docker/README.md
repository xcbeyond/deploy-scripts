# Docker相关

## Docker安装
> CentOS环境

### 手动安装
1.设置repository
```
# yum install -y yum-utils

# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

2.安装Docker engine
> 安装最新版本
```
# yum install -y docker-ce docker-ce-cli containerd.io
```

3.启动Docker
```
# systemctl start docker
```

### 一键安装
运行脚本[install_docker.sh](./install_docker.sh)。
```
# chmod +x ./install_docker.sh
# ./install_docker.sh
```
