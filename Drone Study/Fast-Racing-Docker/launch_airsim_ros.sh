#!/bin/bash

xhost +local:docker
sudo nvidia-docker run -it --rm --name airsim_ros --net=host --ipc=host --privileged -v=/dev:/dev -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority:ro -e NVIDIA_DRIVER_CAPABILITIES=all -e NVIDIA_VISIBLE_DEVICES=all airsim_ros /bin/bash -c "source devel/setup.bash && ./src/Fast-Racing/zhangjiajie.sh" 