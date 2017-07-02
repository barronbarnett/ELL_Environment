FROM ubuntu:16.04
MAINTAINER barronb@barnett-systems.com
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

ENV HOME /root
ENV PATH="/opt/anaconda3/bin:/opt/anaconda3/sbin:${PATH}"
WORKDIR /root

ENTRYPOINT /bin/bash

VOLUME /root

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && apt-get -y update \
&&  apt-get install -y apt-utils software-properties-common \
&&  apt-get -y upgrade \
&& apt-get install -y gcc cmake wget git gcc g++ \
&& wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
&&  apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main" \
&&  apt-get -y update \
&&  apt-get install -y llvm-3.9-dev \
&&  apt-get install -y libedit-dev zlibc zlib1g zlib1g-dev libopenblas-dev doxygen 

RUN  apt-get update \
&& apt-get install -y bzip2 \
&& wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O /root/Anaconda3-install.sh \
&& chmod +x /root/Anaconda3-install.sh \
&& /root/Anaconda3-install.sh -b -p /opt/anaconda3 \
&& rm /root/Anaconda3-install.sh

