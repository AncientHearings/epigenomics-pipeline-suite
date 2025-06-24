FROM  continuumio/miniconda3 AS builder

ENV DEBIAN_FRONTEND=noninteractive 

#......................Add metadata..................
LABEL maintainer="Himanshu: 2032ushimanshu@gmail.com"

WORKDIR /build 

RUN conda install -c conda-forge python=3.9  pip git -y 
#Layer1 
RUN git clone https://github.com/deeptools/deepTools.git 
#Layer2
WORKDIR /build/deepTools

RUN pip install .
#Layer3

#One time RUN statement use --> One layer created.
#Related commands under one run 

#Stage1: container build --> result saved --> Container removed.


#.....................STAGE1...................................

FROM continuumio/miniconda3:latest AS runtime

WORKDIR /app/deepTools

COPY --FROM=builder  /opt/conda /opt/conda 
COPY --FROM=builder /build/deepTools /app/deepTools
ENV PATH=/opt/conda/bin:$PATH 

WORKDIR /app/deepTools

ENTRYPOINT ["deeptools"]







