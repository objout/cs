# container mounts
docker inspect --format '{{ .Mounts }}' 2d

# container env
docker inspect --format '{{ .Config.Env }}' 2d | tr ' ' '\n'

# container name
docker inspect --format '{{ .Name }}' 2d

# container image name
docker inspect --format '{{ .Config.Image }}' 2d

# container image id
docker inspect --format '{{ .Image }}' 2d

# container id
docker inspect --format '{{ .Id }}' 2d

# container status
docker inspect --format '{{ .State.Status }}' 2d

# container exit code
docker inspect --format '{{ .State.ExitCode }}' 2d

# log path
docker inspect --format '{{ .LogPath }}' 2d

# /etc/resolv.conf
docker inspect --format '{{ .ResolvConfPath }}' 2d

# /etc/hostname
docker inspect --format '{{ .HostnamePath }}' 2d

# /etc/hosts
docker inspect --format '{{ .HostsPath }}' 2d

# bind mounts
docker inspect --format '{{ .HostConfig.Binds }}' 2d

# ports
docker inspect --format '{{ .HostConfig.PortBindings }}' 2d

# NetworkMode
docker inspect --format '{{ .HostConfig.NetworkMode }}' 2d

# restart policy
docker inspect --format '{{ .HostConfig.RestartPolicy }}' 2d

# auto rm
docker inspect --format '{{ .HostConfig.AutoRemove }}' 2d

# hostname
docker inspect --format '{{ .Config.Hostname }}' 2d

# user
docker inspect --format '{{ .Config.User }}' 2d

# exposed port
docker inspect --format '{{ .Config.ExposedPorts }}' 2d

# cmd
docker inspect --format '{{ .Config.Cmd }}' 2d

# entrypoint
docker inspect --format '{{ .Config.Entrypoint }}' 2d

# volumes
docker inspect --format '{{ .Config.Volumes }}' 2d

# workingdir
docker inspect --format '{{ .Config.WorkingDir }}' 2d

# ports
docker inspect --format '{{ .NetworkSettings.Ports }}' 2d

# network sandbox id
docker inspect --format '{{ .NetworkSettings.SandboxID }}' 2d

# network sandbox key, network namespace
docker inspect --format '{{ .NetworkSettings.SandboxKey }}' 2d

# ip
docker inspect 2d | grep '"IPAddress"'

# gateway
docker inspect 2d | grep '"Gateway"'

# mac address
docker inspect 2d | grep '"MacAddress"'
