FROM nvidia/cuda:11.1.0-runtime-ubuntu20.04

MAINTAINER nickp27

WORKDIR /

# Package and dependency setup
RUN apt update && apt install wget

RUN wget https://github.com/NebuTech/NBMiner/releases/download/v36.1/NBMiner_36.1_Linux.tgz; \
    tar zxvf NBMiner_36.1_Linux.tgz && rm NBMiner_36.1_Linux.tgz; \
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