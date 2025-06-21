#!/usr/bin/env Rscript

# --------- Libraries ---------
suppressPackageStartupMessages({
  library(ChIPseeker)
  library(TxDb.Hsapiens.UCSC.hg38.knownGene)
  library(org.Hs.eg.db)
  library(GenomicRanges)
  library(tools)
})

# --------- Args ---------
args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 2) {
  cat("Usage: Rscript run_chipseeker.R <input_peak_file> <output_annotation_file>\n")
  quit("no", 1)
}

input_peak <- args[1]
output_file <- args[2]

# --------- Load TxDb & Genome ---------
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene

# --------- Run Annotation ---------
peak <- readPeakFile(input_peak)
peakAnno <- annotatePeak(peak, TxDb = txdb, annoDb = "org.Hs.eg.db")

# --------- Save Output ---------
df <- as.data.frame(peakAnno)
write.table(df, file = output_file, sep = "\t", quote = FALSE, row.names = FALSE)

# --------- Optional Plot ---------
plot_file <- paste0(file_path_sans_ext(output_file), "_pie.png")
png(plot_file)
plotAnnoPie(peakAnno)
dev.off()

cat("Annotation complete. Output saved to:\n")
cat("- Table:", output_file, "\n")
cat("- Plot: ", plot_file, "\n")

