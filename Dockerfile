# This file has been adapted from https://github.com/demartis/matlab_runtime_docker

FROM python:3.10
MAINTAINER Alexander Wilhelmi <me@alexanderwilhelmi.de>

RUN apt update && \
	apt install -y libgl1

# ToDo Do we really need all of them?


RUN cd /tmp && \
	wget https://ssd.mathworks.com/supportfiles/downloads/R2023b/Release/4/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2023b_Update_4_glnxa64.zip && \
	unzip MATLAB_Runtime_R2023b_Update_4_glnxa64.zip && \
	./install -agreeToLicense yes

COPY magicapppythonPackage /home/

Run cd /home && \
	python /home/setup.py install

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/local/MATLAB/MATLAB_Runtime/R2023b/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2023b/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2023b/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/R2023b/extern/bin/glnxa64

ENV XAPPLRESDIR /etc/X11/app-defaults

# ToDo check if this is really needed
ENV MCR_MASTER_PATH /usr/local/MATLAB/MATLAB_Runtime/R2023b


WORKDIR /home

RUN pip install "arkitekt[all]"


COPY . /home