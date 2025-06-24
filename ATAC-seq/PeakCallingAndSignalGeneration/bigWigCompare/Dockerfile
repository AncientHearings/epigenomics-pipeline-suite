FROM continuumio/miniconda3:latest

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Himanshu_Bhandary 2032ushimanshu@gmail.com"
LABEL description="Dockerfile for  deeptools"

ARG DEEPTOOLS_VERSION=3.5.6
#Available only build time only.
#Accepts values from docker build --build-arg 
#Provides default if not specified
#Disappearsa after build.


ENV DEEPTOOLS_VERSION=${DEEPTOOLS_VERSION}
#Build time and runtime
#Create environment variables that persist in the final image
#Available inside runtime containers



RUN conda install -y python=3.8 -c bioconda deeptools=${DEEPTOOLS_VERSION} && conda clean -afy
   
     
WORKDIR /workspace

ENTRYPOINT ["bigWigCompare"]

CMD ["--help"]


