# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 10_Gene_Promoter_Methylation_Correlation_Analysis
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script computes the statistical correlation between gene promoter 
# methylation levels and expression values. It outputs a standardized 
# Scatter Plot capturing epigenetic profiling dynamics.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: GENE-PROMOTER METHYLATION CORRELATION SCATTER
# ------------------------------------------------------------------------------
pdf("output/figure/TMEM45A_gene_methylation_scatter.pdf")

gene_methylation_scatter("BRCA", "TP53")

dev.off()



