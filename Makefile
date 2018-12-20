build: .installed_qemu
	docker build -t streamer .
	docker save streamer > streamer.tar

.installed_qemu: 
	sudo apt update
	sudo apt install -y qemu qemu-user-static qemu-user binfmt-support
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	touch .installed_qemu
