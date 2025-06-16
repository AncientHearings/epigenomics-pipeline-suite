#! /usr/bin/env nextflow


process run_fastqc {
    tag "$reads" //helpful for logging when parallel jobs run
    
    container 'fastqc:0.11.9' //Use docker image
    
    
    input:
    path reads from params.reads
    
    output:
    path "*.html", emit: qc_html
    path "*.zip", emit: qc_zip 
    
    script:
    """
    fastqc $reads
    
    """  
    
