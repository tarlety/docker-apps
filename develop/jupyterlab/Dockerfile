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

# Install Jupyter extension dependencies
RUN apt-get install -y nodejs npm

# Install globall dotnet SDK
# [ref] https://medium.com/machinelearningadvantage/run-c-machine-learning-code-directly-in-a-jupyter-notebook-a32e13e40b9c
RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O dotnet.deb
RUN dpkg -i dotnet.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1

# User not root
RUN groupadd jupyter
RUN chgrp -R jupyter /usr/local/share/jupyter/lab
RUN chmod -R g+w /usr/local/share/jupyter/lab
RUN useradd -u 1000 -ms /bin/bash me
RUN usermod -a -G jupyter me
USER me

# Install Jupyter extension depedencies
RUN pip install jupyterlab-git

# Install dotnet machine learing packages
RUN cd /home/me
RUN dotnet tool install -g dotnet-try
RUN home/me/.dotnet/tools/dotnet-try jupyter install

EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/home/me"]

