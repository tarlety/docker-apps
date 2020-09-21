FROM python:3.6.12-buster
LABEL maintainer="tarlety@gmail.com"

ARG KERAS_VER
ARG TF_VER

ENV KERAS_VER=$KERAS_VER
ENV TF_VER=$TF_VER

RUN apt-get update -y
RUN apt-get install python-opencv -y
RUN pip install numpy sklearn matplotlib opencv-python jupyterlab
# keras and tensorflow version compatibility: https://docs.floydhub.com/guides/environments/
# for CPU without AVX support, downgrade tensorflow version to 1.5.0
RUN pip install keras==$KERAS_VER
RUN pip install tensorflow==$TF_VER

RUN useradd -u 1000 -ms /bin/bash me
USER me

EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/home/me"]

