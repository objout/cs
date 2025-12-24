# QBitTorrent

- 默认 Web UI, `<ip>:8080`，admin 用户的临时密码可通过容器日志查看

## User / Group Identifiers

When using volumes (-v flags), permissions issues can arise between the host OS
and the container, we avoid this issue by allowing you to specify the user PUID
and group PGID.

Ensure any volume directories on the host are owned by the same user you specify
and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id your_user`
as below:

```sh
id your_user
```


## 环境变量

- `WEBUI_PORT`
- `TORRENTING_PORT`

## Commands

```sh
# get shell
docker exec -it qbittorrent /bin/bash

# monitor the logs of the container in realtime
docker logs -f qbittorrent

# container version number
CONTAINER_NAME=qbittorrent
docker inspect -f '{{ index .Config.Labels "build_version" }}' $CONTAINER_NAME

# image version number
IMAGE_NAME=lscr.io/linuxserver/qbittorrent:latest
docker inspect -f '{{ index .Config.Labels "build_version" }}' $IMAGE_NAME
```

## Update

### Via Docker Compose

Update images:

```sh
# update all images
docker-compose pull

# update single image
docker-compose pull qbittorrent
```

Update containers:

```sh
# update all containers
docker-compose up -d

# update single container
docker-compose up -d qbittorrent
```

Remove the old dangling images:

```sh
docker image prune
```

### CLI

```sh
# 1. update the image
docker pull lscr.io/linuxserver/qbittorrent:latest

# 2. stop the running container
docker stop qbittorrent

# 3. delete the container
docker rm qbittorrent

# 4. Recreate a new container with the same docker run parameters as instructed
# above (if mapped correctly to a host folder, your /config folder and settings
# will be preserved)

# 5. remove the old dangling images (optional)
docker image prune
```
