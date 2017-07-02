FROM ubuntu:16.04
MAINTAINER barronb@barnett-systems.com
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

ENV HOME /root
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
&&  apt-get install -y libedit-dev zlibc zlib1g zlib1g-dev libopenblas-dev doxygen \

