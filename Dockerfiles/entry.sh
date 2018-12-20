#!/bin/bash

echo Streaming url: $1

ffmpeg -f alsa -i hw:1,0 -f v4l2 -i /dev/video0 -s 320x240 -ar 11025 -f flv -r 30.0  rtmp://a.rtmp.youtube.com/live2/$1
