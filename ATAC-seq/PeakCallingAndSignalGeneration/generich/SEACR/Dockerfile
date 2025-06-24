FROM ubuntu: 20.04

ENV DEBIAN_FRONTEND=noninteractive 


LABEL maintainer="Himanshu Bhandary 2032ushimanshu@gmail.com
LABEL description="Dockerfile for SEACR"

RUN apt-get  update && \
    apt-get install -y \
     wget \
        curl \
        bedtools \
        r-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/FredHutch/SEACR/master/SEACR_1.3.sh -O SEACR && \
    chmod +x SEACR

    
ENV PATH=/opt/seacr:${PATH}

WORKDIR /workspace 

ENTRYPOINT ["SEACR"]


