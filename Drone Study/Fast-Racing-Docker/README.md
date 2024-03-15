## Fast Racing opensource dockerization

This project directory is for dockerfile of Fast-Racing opensource environments.

### Installation

1. Download the Unreal project binary files from [link](https://github.com/ZJU-FAST-Lab/Fast-Racing/releases/tag/v1.0)  
2. Clone this repository and build dockerfile here.

```
> sudo docker build -t airsim_ros .
```

3. launch the shell script

```
> bash launch_airsim_ros.sh
```

### Project file descriptions

1. Dockerfile: dockerfile for docker image build
2. launch_airsim_ros: command for docker container contains:
   1. container environment variables
   2. launch script inside the docker container
3. configs/settings.json: Unreal API's configuration file
4. configs/ctrl_param_fpv.yaml: drone's control configuration