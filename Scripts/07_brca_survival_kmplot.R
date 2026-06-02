# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 07_BRCA_Cohort_Survival_Analysis_Kaplan_Meier
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script performs time-to-event survival analysis within the BRCA cohort. 
# It stratifies breast cancer patients into high and low TMEM45A expression groups 
# based on median expression cutoffs and computes Kaplan-Meier survival curves 
# integrated with log-rank statistical testing to evaluate prognostic significance.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Clearing global workspace memory to eliminate residual data locks from prior scripts
rm(list = ls())

# Loading target packages required for survival analytics and graphical plotting
library(TCGAplot)
library(tidyverse)
library(paletteer)
library(gridtext) # Necessary for rendering enriched rich-text formatting on plots

# ------------------------------------------------------------------------------
# SECTION 2: KAPLAN-MEIER SURVIVAL PLOTTING PIPELINE
# ------------------------------------------------------------------------------
# Data Engine: Queries survival duration metadata (OS/DFS) from the TCGA-BRCA matrix.
pdf("output/figure/tcga_kmplot.pdf") # Fully aligned with local directory naming layout

tcga_kmplot(
  "BRCA", 
  "TMEM45A",
  palette = "AsteroidCity2" # Consistent publication-grade palette theme
)

dev.off()


