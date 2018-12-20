FROM resin/rpi-raspbian:stretch

RUN apt-get update -qy && apt-get -qy --no-install-recommends install \
  build-essential git libraspberrypi-bin libomxil-bellagio-dev libasound2-dev
WORKDIR /root/
RUN git clone https://github.com/FFmpeg/FFmpeg.git
WORKDIR /root/FFmpeg
RUN ./configure --arch=armel --target-os=linux --enable-indev=alsa --enable-gpl --enable-omx --enable-omx-rpi --enable-nonfree
RUN echo cores $(nproc) && make -j $(nproc) && make install
RUN rm -rf /root/FFmpeg/* /var/lib/apt/lists/*
WORKDIR /root/
COPY entry.sh	.
RUN chmod +x entry.sh

ENTRYPOINT ["./entry.sh"]

