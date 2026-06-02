# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 06_BRCA_Gene_CoExpression_Heatmap_Mapping
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script maps the transcriptional co-expression landscape of TMEM45A within 
# the BRCA cohort. By identifying positively and negatively correlated gene clusters, 
# it defines the molecular network context that serves as the direct baseline input 
# for downstream Functional Enrichment and Gene Ontology (GO) modeling.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing memory slots to prevent matrix carry-over from preceding clinical scripts
rm(list = ls())

# Loading plotting engines and data frame manipulation suites
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: DIRECTORY VALIDATION & HIGH-RESOLUTION RENDERING (CAIRO)
# ------------------------------------------------------------------------------
# Safely asserting directory tree existence to prevent Win 11 write-lock errors
dir.create("output/figure", recursive = TRUE, showWarnings = FALSE)

# Utilizing Cairo engine for anti-aliased, high-density vector matrix output.
# This prevents axis text distortion in large pan-genomic clusters.
cairo_pdf(
  "output/figure/coexp_heatmap.pdf", # Aligned with local directory file naming structure
  width  = 14,
  height = 10
)

# ------------------------------------------------------------------------------
# SECTION 3: CORE CO-EXPRESSION MATRIX GENERATION
# ------------------------------------------------------------------------------
# Computing correlation coefficients across the BRCA transcriptomic matrix 
# to isolate genes synchronized with TMEM45A expressions.
gene_coexp_heatmap(
  "BRCA", 
  "TMEM45A"
)

dev.off()

