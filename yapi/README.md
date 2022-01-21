# yapi-docker-deploy

[YApi](https://github.com/YMFE/yapi) 是高效、易用、功能强大的 api 管理平台，旨在为开发、产品、测试人员提供更优雅的接口管理服务。可以帮助开发者轻松创建、发布、维护 API，YApi 还为用户提供了优秀的交互体验，开发人员只需利用平台提供的接口数据写入工具以及简单的点击操作就可以实现接口的管理。

在有网络的条件下，可直接通过可视化部署（yapi-cli 工具）是非常简单的，但在内网（无外网）下，却无能为力。因此，特制作  Docker 镜像，可通过 docker-compose 或 Kubernetes 等方式一键部署 YApi。

## 镜像制作

**这部分主要讲述镜像的制作过程，docker 镜像已推送至 [docker hub](https://hub.docker.com/r/xcbeyond/yapi)，直接拉取，无需自己动手制作镜像。**

> config.json: YApi 配置文件，可按需修改打入到镜像。
>
> commons.js：解决 YApi [bug 问题](https://github.com/YMFE/yapi/issues/2231)。

1. 克隆本项目代码到本地

    ```sh
    git clone https://github.com/xcbeyond/deploy-scripts.git
    ```

2. 构建镜像

    ```sh
    # 切换到 yapi 目录
    cd yapi
    # 需要花费一点时间
    docker build -t xcbeyond/yapi:1.9.2 .
    ```

3. 推送镜像

   ```sh
   docker push xcbeyond/yapi:1.9.2
   ```

## 一键部署

支持通过 docker-compose 和 Kubernetes 两种方式一键部署。

### docker 镜像 tar 包获取

> 有外网时，可忽略该操作。

如果在离线（无外网）情况下，需事先准备好 docker 镜像tar包。

1. 在能正常连接外网的 docker 环境下，拉取镜像 `xcbeyond/yapi`。

   ```sh
   docker pull xcbeyond/yapi:1.9.2
   ```

2. 生成 docker 镜像 tar 包。

   ```sh
   docker save -o yapi-1.9.2.tar xcbeyond/yapi:1.9.2
   ```

3. 将镜像 tar 包 yapi-1.9.2.tar 上传将要部署的环境上。

4. 导入镜像 tar 包。

    ```sh
    docker load < yapi-1.9.2.tar
    ```

### docker-compose 部署

将 docker-compose 文件 [/yaip/docker-compose/docker-compose.yaml](./docker-compose/docker-compose.yaml) 上传至部署环境上，执行 docker-compose 命令 `docker-compose up -d` 完成部署即可。（卸载：`docker-compose down`）

浏览器访问地址 `http://<部署环境IP>:3000`，可用超级管理员登录或直接注册新账号。

> 超级管理员：`admin@admin.com`、`123456`，登录后建议修改密码。

> 更多 docker-compose 相关命令可参考：[Docker Compose常用命令](http://c.biancheng.net/view/3168.html)

**注意：部署、验证后，建议修改 `docker-compose.yaml` 文件，将启动参数修改为 `start`，否则 yapi 重启后无法正常运行。**

### Kubernetes 部署

将 [Kubernetes 部署资源文件](./kubernetes/)上传至部署环境上，通过命令 `kubectl apply -f` 执行文件 [mongodb.yaml](./kubernetes/mongodb.yaml) 和 [yapi.yaml](./kubernetes/yapi.yaml) 完成部署即可。

```sh
kubectl apply -f mongodb.yaml
kubectl apply -f yapi.yaml
```

浏览器访问地址 `http://<部署环境IP>:30300`，可用超级管理员登录或直接注册新账号。

> 超级管理员：`admin@admin.com`、`123456`，登录后建议修改密码。

**注意：部署、验证后，建议修改 `yapi.yaml` 文件，将启动参数修改为 `start`，否则 yapi Pod 重启后无法正常运行。**
