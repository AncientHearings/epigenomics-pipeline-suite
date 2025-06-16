#Use lightweight Ubuntu base image
FROM ubuntu:22.04

#Avoid Interactive dialogue during install 
ENV DEBIAN_FRONTEND=noninteractive

#INSTALL DEPENDENCIES: java, unzip and wget 
RUN apt-get upgrade && apt-get install -y \
    unzip \
    wget \
    openjdk-11-jre-headless \
    && apt-get clean 
    
#SET WORKING DIRECTORY 
WORKDIR /opt 

#Download FastQC
RUN wget -q https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip \
    && unzip fastqc_v0.11.9.zip \
    && rm fastqc_v0.11.9.zip \
    && chmod +x FastQC/fastqc
    
#Add FastQC to PATH 
ENV PATH="/opt/FastQC/:${PATH}"

#Default 
CMD ["fastqc", "--help"]


        
    
