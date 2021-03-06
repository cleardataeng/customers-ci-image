FROM ubuntu:focal-20200423
ARG DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /root/requirements.txt

RUN apt update
RUN apt -q -y install git python3-pip curl zip parallel

# Put on tfenv
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN ln -s ~/.tfenv/bin/* /usr/local/bin

# Put on python modules
RUN /usr/bin/pip3 --no-cache-dir install -r /root/requirements.txt

# Install terraform 12 and 13 versions
RUN /usr/local/bin/tfenv list-remote | grep -E '0.1[2-3].[0-9]{1,3}$' | parallel /usr/local/bin/tfenv install
RUN /usr/local/bin/tfenv use 0.12.0

# aws-sudo
ADD aws-sudo/aws-sudo.sh /usr/local/bin/aws-sudo.sh

# disable hashicorp phone-home
ENV CHECKPOINT_DISABLE=1

ENTRYPOINT /bin/bash