FROM python:3.6.12-buster
LABEL maintainer="tarlety@gmail.com"

RUN apt-get update -y
RUN apt-get install python-opencv -y
RUN pip install numpy sklearn matplotlib opencv-python jupyterlab imutils
# keras and tensorflow version compatibility: https://docs.floydhub.com/guides/environments/
# for CPU without AVX support, downgrade tensorflow version to 1.5.0
RUN pip install keras==2.1.6 tensorflow==1.5.0

RUN useradd -u 1000 -ms /bin/bash me
USER me

EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/home/me"]

