# docker for node-server

> 容器地址：https://hub.docker.com/r/hiwork/node-server

### 一、说明

组成：`alpine` + `nodejs` + `npm` + 自定义的一个`nodeHttpServer脚本`。

问题和联系：Q 4-9-9-1-4-6-4-1-6  （请备注dockerHub-node-server）

### 二、用法

* 运行默认服务(仅用于测试)
```
podman run -d --name http8081 -p 8081:80 node-server npm run dev
```

* 正式使用
第1步：调用npm更新依赖

```
podman run -d --name npm-install-web8081 -v /var/www/web8081:/www node-server npm update
```
说明1：此行命令执行完成后立即退出容器，但依赖的安装可能会延后;  
说明2：初始环境下已执行过安装依赖，所以这里要使用 `npm update`;  
说明3：依赖安装完成后，此容器（npm-install-web8081）可以删除，也可保留，当要更新依赖时再次启动容器。  

第2步：开启http服务
```
podman run -d --name web8081 -p 8081:80 -v /var/www/web8081:/www node-server npm run dev

或 

podman run -d --name web8081 -p 8081:80 -v /var/www/web8081:/www node-server node yourAppRun.js
```

说明：'npm run dev' 是执行 '/var/www/web8081/package.json' 中的 scripts 中的 'dev脚本'。

