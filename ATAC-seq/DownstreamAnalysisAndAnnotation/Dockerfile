
#.................BASE IMAGE.............................
FROM  bioconductor/bioconductor_docker:RELEASE_3_18

#.............ADD METADATA...............................
LABEL maintainer="2032ushimanshu@gmail.com"
LABEL description="Docker container for ChIP seeker peak annotation"

#..............Install Required R packages..............
RUN R -e "BiocManager::install(c('ChIPseeker', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 'org.Hs.eg.db'))"

#...............SET THE WORKING DIRECTORY..............
WORKDIR /data

#................COPY THE WRAPPER SCRIPT...............
COPY run_chipseeker.R /usr/local/bin/run_chipseeker
RUN  chmod +x /usr/local/bin/run_chipseeker #clean and consistent.



#........................Set Entrypoint............................................
ENTRYPOINT ["Rscript", "/usr/local/bin/run_chipseeker.R"]


