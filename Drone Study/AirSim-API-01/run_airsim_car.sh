#!/bin/bash

xhost +local:docker
sudo nvidia-docker run -it -d --rm --name airsim_car --net=host --privileged -v=/dev:/dev -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority:ro -e NVIDIA_DRIVER_CAPABILITIES=all -e NVIDIA_VISIBLE_DEVICES=1 airsim_car /bin/bash