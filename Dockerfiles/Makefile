build: ../Images/streamer.tar

../Images/streamer.tar :.installed_qemu
	docker build -t ptigas/streamer .
	mkdir -p ../Images
	docker save streamer > ../Images/streamer.tar

.installed_qemu:
	sudo apt update
	sudo apt install -y qemu qemu-user-static qemu-user binfmt-support
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	touch .installed_qemu
