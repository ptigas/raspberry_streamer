FROM resin/rpi-raspbian:stretch

RUN apt-get update -qy && apt-get -qy --no-install-recommends install \
  build-essential git libraspberrypi-bin \
  libomxil-bellagio-dev libasound2-dev \
  cmake libx264-dev
RUN cd \
    && git config --global http.sslVerify false \
    && git clone --depth 1 https://github.com/raspberrypi/userland.git \
    && cd userland \
    && ./buildme
ENV PATH /opt/vc/bin:/opt/vc/lib:$PATH
# update library path (to get past: raspistill: error while loading shared libraries: libmmal_core.so: cannot open shared object file: No such file or directory)
RUN ldconfig
WORKDIR /root/
RUN git clone https://github.com/FFmpeg/FFmpeg.git
WORKDIR /root/FFmpeg
RUN ./configure --arch=armel --target-os=linux --enable-indev=alsa --enable-gpl --enable-omx --enable-omx-rpi --enable-nonfree --enable-libx264 --enable-nonfree --enable-mmal
RUN echo cores $(nproc) && make -j $(nproc) && make install
RUN rm -rf /root/FFmpeg/* /var/lib/apt/lists/*
WORKDIR /root/
COPY entry.sh	.
RUN chmod +x entry.sh

ENTRYPOINT ["./entry.sh"]