
## Install QEMU

```
 sudo apt update
 sudo apt install -y qemu qemu-user-static qemu-user binfmt-support
```

## Register QEMU as build system for docker

```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

## Build the image

```
docker build -t streamer .
```
