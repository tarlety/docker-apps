FROM python:3.6.12-buster
LABEL maintainer="tarlety@gmail.com"

ARG KERAS_VER
ARG TF_VER

ENV KERAS_VER=$KERAS_VER
ENV TF_VER=$TF_VER

# Install python machine learning packages
RUN apt-get update -y
RUN apt-get install python-opencv -y
RUN pip install numpy sklearn matplotlib opencv-python jupyterlab
# keras and tensorflow version compatibility: https://docs.floydhub.com/guides/environments/
# for CPU without AVX support, downgrade tensorflow version to 1.5.0
RUN pip install keras==$KERAS_VER
RUN pip install tensorflow==$TF_VER

# Install globall dotnet SDK
# [ref] https://medium.com/machinelearningadvantage/run-c-machine-learning-code-directly-in-a-jupyter-notebook-a32e13e40b9c
RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O dotnet.deb
RUN dpkg -i dotnet.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1

# User not root
RUN useradd -u 1000 -ms /bin/bash me
USER me

# Install dotnet machine learing packages
RUN dotnet tool install -g dotnet-try

EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/home/me"]

