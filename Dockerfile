FROM nvidia/cuda:11.1.1-runtime-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git curl python3.8 python3.8-distutils
RUN alias python=python3.8 && echo 'alias python=python3.8' >> ~/.bashrc
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.8 get-pip.py

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 -f https://download.pytorch.org/whl/torch_stable.html

WORKDIR /workspace
