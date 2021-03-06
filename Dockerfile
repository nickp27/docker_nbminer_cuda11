FROM nvidia/cuda:11.1.1-runtime-ubuntu20.04

MAINTAINER nickp27

WORKDIR /
# Package and dependency setup
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y wget && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/NebuTech/NBMiner/releases/download/v37.5/NBMiner_37.5_Linux.tgz; \
    tar zxvf NBMiner_37.5_Linux.tgz && rm NBMiner_37.5_Linux.tgz; \
    cd NBMiner_Linux; \
    chmod +x ./nbminer; \
    cp ./nbminer /usr/local/bin/nbminer

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/nbminer"]