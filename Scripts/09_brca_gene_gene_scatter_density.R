# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 09_BRCA_Specific_Gene_Gene_Correlation_Scatter_Mapping
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script quantifies the exact transcriptomic co-expression relationship 
# between TMEM45A and the oncogenic chaperone target CCT5 within the BRCA cohort. 
# It generates a high-resolution Scatter Plot integrated with local 2D Kernel 
# Density Contours to visualize sample distribution density and linear regression.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing global workspace memory to eliminate multi-gene matrix locks from network analysis
rm(list = ls())

# Loading verified target packages for statistical scaling and plotting
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: SPECIFIC GENE-GENE CORRELATION WITH DENSITY CONTOURS
# ------------------------------------------------------------------------------
# Parameter Matrix: 
# - Target Tumor Cohort: "BRCA" (Breast Invasive Carcinoma)
# - X/Y Vectors: "TMEM45A" vs. "CCT5"
# - density = "T" : Overlay 2D probability density estimation lines on top of the dots.
pdf("output/figure/gene_gene_scatter_density.pdf") # Aligned with local folder layout

gene_gene_scatter(
  "BRCA",
  "TMEM45A",
  "CCT5",
  density = "T" # "T" activates high-impact kernel density overlay boundaries
)

dev.off()

