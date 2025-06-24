#By UCSC(University of California Santa Cruz)
#.bedGraph is conmpressed into .bigWig format 

#It needs chromosome sizes file and .bedGraph input file 

#multi-stage build 
 #We can use as much as FROM statements .
 #One base is for one task.
 #Tasks can be splitted. 
 
#..................FIRST STAGE..............................
FROM ubuntu:20.04 AS compiler

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -O http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig && \
    chmod +x bedGraphToBigWig && \
    mv bedGraphToBigWig /opt/ucsc/

#............................................................
#AS means name this stage as 
FROM ubuntu:20.04 AS runtime

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="HimanshuBhandary 2032ushimanshu@gmail.com"
LABEL description="Dockerfile for bedGraphToBigWig"

COPY --from=compiler  /opt/ucsc/bedGraphToBigWig /usr/local/bin/bedGraphToBigWIg

ENV PATH=/opt/ucsc/:${PATH}

WORKSPACE /workspace

RUN bedGraphToBigWig 2>&1 | grep -i "Usage"

ENTRYPOINT ["bedGraphToBigWig"]


#................................................................
#Container 1: Compile code --> Save binary
#Container 2: Copy binary -->Run app

#Separation of concerns
#Smaller final images
#Better security
#Cleaner Organization
#Reusability



#Stage1: Create temp container --> Do work --> Save result --> Destroy Container

#Final Stage: Create temp container --> Copy from previosu stages --> Create final image

#During docker run:

 #--> Only the final image exists
 #--> Create ONE container from final image
 #--> No intermediate containers exist anymore'
