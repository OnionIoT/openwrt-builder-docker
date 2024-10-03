# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04
MAINTAINER Lazar Demin <lazar@onioniot.com>


# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory to /root
WORKDIR /root

# Update and install the required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    flex \
    bison \
    g++ \
    gawk \
    gcc-multilib \
    g++-multilib \
    gettext \
    git \
    libncurses-dev \
    libssl-dev \
    python3-distutils \
    python3-setuptools \
    rsync \
    swig \
    unzip \
    zlib1g-dev \
    file \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the default command
CMD ["bash"]
