build: ../Images/streamer.tar

../Images/streamer.tar :.installed_qemu ../Images/raspberry_ffmpeg.tar
	docker load --input ../Images/raspberry_ffmpeg.tar
	docker build -f Dockerfile.streamer -t streamer .
	mkdir -p ../Images
	docker save streamer > ../Images/streamer.tar

../Images/raspberry_ffmpeg.tar:
	docker build -f Dockerfile.ffmpeg -t raspberry_ffmpeg .
	mkdir -p ../Images
	docker save raspberry_ffmpeg > ../Images/raspberry_ffmpeg.tar

.installed_qemu:
	sudo apt update
	sudo apt install -y qemu qemu-user-static qemu-user binfmt-support
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	touch .installed_qemu
