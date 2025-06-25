#Base image
FROM alpine:latest AS Downloader

#Avoid interactive dialogues
ENV DEBIAN_FRONTEND=noninteractive

#Add metadata
LABEL maintainer="Himanshu: 2032ushimanshu@gmail.com"

WORKDIR /download
#The below commands will run from this directory.

#One layer. Related commands under one RUN 
RUN apk add --no-cache curl unzip && \
    curl -L -o igvtools.zip https://data.broadinstitute.org/igv/projects/downloads/igvtools_2.16.0.zip && \
    unzip igvtools.zip
#Stage1: Build container --> Save result --> Destroy container

#...............................................................

FROM openjdk:8-jre-slim AS runtime

WORKDIR /app

COPY --FROM=Downloader /downloads/igvtools_2.16.0 /app/igvtools   

ENV PATH="/app/igvtools:$PATH"

ENTRYPOINT ["java", "-Xmx2g", "-jar", "/app/igvtools/igvtools.jar"]

CMD ["--help"]


