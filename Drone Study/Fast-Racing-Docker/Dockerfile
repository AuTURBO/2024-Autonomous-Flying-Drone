FROM osrf/ros:melodic-desktop-full

SHELL ["/bin/bash", "-c"]
RUN mkdir -p /workspace/src
WORKDIR /workspace
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y locales curl
RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc-8 \
                    g++-8 \
                    libarmadillo-dev \
                    ros-melodic-octomap* \
                    ros-melodic-tf2-sensor-msgs \
                    ros-melodic-tf2-geometry-msgs \
                    ros-melodic-mavros* \
                    ros-melodic-catkin \
                    python3-osrf-pycommon \
                    python3-catkin-tools \
                    python3-pip \
                    ros-melodic-desktop-full \
                    libeigen3-dev \
                    git \
                    python-rosdep \
                    python-rosinstall-generator \
                    python-wstool \
                    build-essential \
                    python-rosinstall
RUN pip3 install --user git+https://github.com/catkin/catkin_tools.git
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc 
RUN source /opt/ros/melodic/setup.bash
RUN cd /workspace/src && git clone https://github.com/ros/catkin.git
RUN cd /workspace && catkin build && source devel/setup.bash
RUN rm -rf /etc/ros/rosdep/sources.list.d/20-default.list
RUN rosdep init \
    && rosdep fix-permissions \
    && rosdep update
RUN cd /workspace/src && git clone https://github.com/ZJU-FAST-Lab/Fast-Racing
RUN cd /workspace && catkin clean -y
RUN source /opt/ros/melodic/setup.bash && catkin_make -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 
ENV ROS_IP=222.234.124.176
ENV ROS_MASTER_URI='http://222.234.124.176:11311'
RUN mkdir -p /root/Documents/AirSim
COPY ./configs/settings.json /root/Documents/AirSim
COPY ./configs/ctrl_param_fpv.yaml /workspace/src/Fast-Racing/src/Ctrl/config/

CMD ["/bin/bash"]