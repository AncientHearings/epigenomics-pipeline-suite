FROM  ubuntu AS  builder

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Himanshu: 2032ushimanshu@gmail.com"

RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        zlib1g-dev && \
    apt-get clean
WORKRDIR /src    
RUN git clone --depth 1 https://github.com/arq5x/bedtools2.git 
WORKDIR /src/bedtools2
RUN make -j4

FROM ubuntu:20.04

COPY --from=builder /src/bedtools2/bin/bedtools /usr/local/bin/bedtools

WOKRDIR /workspace

ENTRYPOINT ["bedtools"]

CMD ["--help"]


