FROM buildpack-deps:xenial
MAINTAINER Michael Opitz <michael.opitz@icg.tugraz.at>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    gcc \
    git \
    g++ \
    imagemagick \
    libatlas-dev \
    libatlas-base-dev \
    libboost-all-dev \
    libblas-dev \
    libeigen3-dev \
    liblapack-dev \
    liblas-dev \
    liblas-c-dev \
    libprotobuf-dev \
    mlocate \
    unzip \
    wget \
    openssh-server \
    puppet \
    sudo \
    wget \
    curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && wget http://46.163.74.205/opencv_2.4.11-1_amd64.deb \
  && dpkg -i opencv_2.4.11-1_amd64.deb
RUN useradd --create-home --shell /bin/bash vagrant
RUN echo vagrant:vagrant | chpasswd
RUN echo root:vagrant | chpasswd
