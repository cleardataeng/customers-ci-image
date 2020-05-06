FROM ubuntu:focal-20200423
ARG DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /root/requirements.txt

RUN apt-get update
RUN apt-get -q -y install python3-pip

RUN pip3 --no-cache-dir install -r /root/requirements.txt

# aws-sudo
ADD aws-sudo/aws-sudo.sh /usr/local/bin/aws-sudo.sh
