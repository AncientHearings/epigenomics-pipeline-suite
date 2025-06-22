FROM  continuumio/miniconda3

LABEL MAINTAINER="2032ushimanshu@gmail.com"
LABEL DESCRIPTION="Docker file for deeptools"

ENV DEBIAN_FRONTEND=noninteractive

RUN conda update -n base -c defaults conda && \
    conda install -c bioconda -c conda-forge deeptools && \
    conda clean --all --yes

WORKDIR /data

ENTRYPOINT ["alignmentSeive"]
