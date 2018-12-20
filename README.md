This is a docker image for raspberry pi that allows streaming of usb video and usb audio to youtube live.

# Using Makefile

Just run `make` and will take care the rest. Tested on WSL windows / ubuntu

# Manual Installation

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
