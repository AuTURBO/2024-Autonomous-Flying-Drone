FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl nano python3-pip unzip portaudio19-dev git

WORKDIR /workspace
COPY requirements.txt .
RUN git clone https://github.com/Microsoft/AirSim.git
RUN pip3 install -r requirements.txt
RUN cd AirSim/PythonClient && pip3 install -r requirements.txt

CMD ["/bin/bash"]