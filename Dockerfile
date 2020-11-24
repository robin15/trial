FROM ubuntu:18.04

LABEL maintainer "vagrant"
LABEL title="cunit container"
LABEL version="beta-1.0"
LABEL description="This imae is for unit test"

RUN apt-get update && apt-get install -y \
    make \
    ssh \
    gcc \
    git \
    lcov \
    libcunit1-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 22

