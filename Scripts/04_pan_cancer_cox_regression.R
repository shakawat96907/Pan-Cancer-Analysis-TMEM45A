# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 04_Pan_Cancer_Cox_Regression_Forest_Plot
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script executes a survival risk assessment by computing Cox Proportional 
# Hazards Regression for TMEM45A across multiple TCGA cancer types. The output 
# is rendered into a high-impact Forest Plot displaying Hazard Ratios (HR), 
# 95% Confidence Intervals (CI), and log-rank p-values.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Purging active memory matrices to prevent cross-talk from immune correlation data
rm(list = ls())

# Loading statistical plotting and formatting libraries
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: COX PROPORTIONAL HAZARD REGRESSION & VISUALIZATION
# ------------------------------------------------------------------------------
# Parameter Optimization: 'onefile = FALSE' forces R graphics device to freeze 
# multi-layer data tracks into a clean, single-page, publication-ready vector PDF.
pdf("output/figure/pan_forest.pdf", onefile = FALSE)

# Executing the survival risk modeling
pan_forest(
  "TMEM45A", 
  adjust = FALSE  # Set to FALSE to focus on baseline Cox survival modeling 
  # without multi-test p-value adjustment (e.g., FDR/Bonferroni)
)

dev.off()
