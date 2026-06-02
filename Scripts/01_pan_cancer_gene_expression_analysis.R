# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 01_Pan_Cancer_Gene_Expression_Analysis
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script evaluates the baseline transcriptomic expression profile of TMEM45A 
# across multiple TCGA cancer cohorts. It generates differential tumor vs. normal 
# comparisons, paired tissue analysis, and an overview of tumor-only cross-cancer 
# expression ranks using the TCGAplot engine.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing global environment memory to prevent variable bleeding between scripts
rm(list = ls())

# Loading target packages verified by local project library management setup
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: PAN-CANCER DIFF-EXPRESSION & VISUALIZATION PIPELINE
# ------------------------------------------------------------------------------

# --- SUBSECTION 2.1: PAN-CANCER TUMOR-NORMAL BOXPLOT ---
# Evaluating independent sample variance between primary tumors and normal control cohorts.
# Data Engine: Directly queries integrated TCGA baseline datasets.
pdf("output/figure/box_plot.pdf", width = 10, height = 5)

pan_boxplot(
  "TMEM45A", 
  palette = "AsteroidCity2",   # Custom aesthetic palette via paletteer engine
  legend  = "right", 
  method  = "wilcox.test"      # Non-parametric Wilcoxon rank-sum test for significance
)
dev.off()


# --- SUBSECTION 2.2: PAIRED TUMOR-NORMAL BOXPLOT ---
# Examining matched-tissue samples from the same patient to eliminate genetic background bias.
pdf("output/figure/pan_paired_box_plot.pdf", width = 10, height = 6)

pan_paired_boxplot(
  "TMEM45A", 
  palette = "AsteroidCity2",
  method  = "wilcox.test",     # Paired Wilcoxon signed-rank test mapping molecular shifts
  legend  = "none"             # Legend stripped to emphasize intra-cohort trend lines
)
dev.off()


# --- SUBSECTION 2.3: PAN-TUMOR COMPARATIVE BOXPLOT ---
# Visualizing expression density across different primary malignancy cohorts (Tumor only)
# to evaluate which tumor type exhibits the highest transcriptional activation of TMEM45A.
pdf("output/figure/pan_tumor_boxplot.pdf", width = 11, height = 6)

pan_tumor_boxplot(
  "TMEM45A"
)
dev.off()
