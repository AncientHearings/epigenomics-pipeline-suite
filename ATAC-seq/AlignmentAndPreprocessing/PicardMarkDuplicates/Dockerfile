FROM openjdk:11-jre-slim 

ENV DEBIAN_FRONTEND=noninteractive

LABEL MAINTAINER="2032ushimanshu@gmail.com"
LABEL DESCRIPTION="Dockerfile for picard markdup duplicates"

ENV PICARD_VERSION=2.27.1
RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    RUN wget https://github.com/broadinstitute/picard/releases/download/${PICARD_VERSION}/picard.jar -O /usr/local/bin/picard.jar #Downloading picard jar 
    
WORKDIR /workspace 

ENTRYPOINT [""java", "-jar", "/usr/local/bin/picard.jar"]
