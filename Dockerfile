FROM ubuntu:focal-20200423
ARG DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /root/requirements.txt

# Get apt working and put on needed packages
RUN apt-get update
RUN apt-get -q -y install git python3-pip curl zip parallel

# Put on tfenv
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN ln -s ~/.tfenv/bin/* /usr/local/bin

RUN /usr/local/bin/tfenv list-remote | grep -E '0.1[2-3].[0-9]{1,3}$' | parallel /usr/local/bin/tfenv install
RUN /usr/local/bin/tfenv use 0.12.0

# Put on python modules
RUN pip3 --no-cache-dir install -r /root/requirements.txt

# aws-sudo
ADD aws-sudo/aws-sudo.sh /usr/local/bin/aws-sudo.sh
