#............................BASE IMAGE................................
FROM  ubuntu:20.04

#.............................AVIOD INTERACTIVE DIALOGUES.................................
ENV DEBIAN_FRONTEND=noninteractive

#..............................METADATA.........................
LABEL maintainer="2032ushimanshu@gmail.com"
LABEL description="Dockerfile for Genrich -ATAC-seq Peak caller"

#.......................INSTALL DEPENDENCIES....................
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        zlib1g-dev \
        wget \
        python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
#CLONE AND SETUP GENERICH...........................................    
RUN  git clone https://github.com/jsh58/Genrich.git /opt/Genrich && \
     cd /opt/Genrich && \
     make
    
ENV PATH="/opt/Genrich:${PATH}"
#PATH is a special environment variable that tell the system where to look for executable programs when comman dis typed. 
#The command is available system-wide\

RUN Genrich --help

WORKDIR /workspace 


ENTRYPOINT ["Genrich"]





