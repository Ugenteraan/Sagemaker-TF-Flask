#sagemaker
FROM ubuntu:16.04
MAINTAINER ugenteraan@ombre.me

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install python3.5 python3.5-dev -y
RUN apt-get update --fix-missing
RUN apt-get install python3-pip libglib2.0-0 libsm6 libxrender1 libfontconfig1 libxext6 libgl1-mesa-glx -y
RUN pip3 install pip --upgrade
RUN pip3 install tensorflow==1.9.0
RUN pip3 install opencv-python
RUN pip3 install flask flask-uploads
COPY mnist_model/mnist.ckpt.meta /opt/ml/data/
COPY mnist_model/ /opt/ml/model/
COPY serve /opt/program/

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

WORKDIR /opt/program

ENTRYPOINT ["/usr/bin/python3", "/opt/program/serve"]

EXPOSE 8080 7473 7687