# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 02_Pan_Cancer_Correlation_Analysis
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script quantifies the statistical correlation between TMEM45A expression 
# and key molecular indicators of genomic instability: Tumor Mutational Burden (TMB) 
# and Microsatellite Instability (MSI) across multiple TCGA cohorts. Visualizations 
# are mapped via multi-axial Radar Charts using Pearson correlation modeling.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing memory to prevent variable carry-over from the expression script
rm(list = ls())

# Loading operational packages for multi-variate modeling and layout composition
library(TCGAplot)
library(tidyverse)
library(paletteer)
library(patchwork) # Essential for multi-panel figure binding

# ------------------------------------------------------------------------------
# SECTION 2: GENOMIC INSTABILITY (TMB & MSI) RADAR MAPPING
# ------------------------------------------------------------------------------

# --- SUBSECTION 2.1: TUMOR MUTATIONAL BURDEN (TMB) CORRELATION ---
# Evaluates if TMEM45A expression correlates with hypermutation states across cohorts.
# Correlation Engine: Pearson coefficient calculation.
pdf("output/figure/TMB_correlation.pdf")

gene_TMB_radar(
  "TMEM45A",
  method = "pearson" # Parametric approach assuming linear scaling across normal-like variants
)
dev.off()


# --- SUBSECTION 2.2: MICROSATELLITE INSTABILITY (MSI) CORRELATION ---
# Investigates relationship with DNA Mismatch Repair (MMR) deficiency signals.
pdf("output/figure/MSI_correlation.pdf")

gene_MSI_radar(
  "TMEM45A",
  method = "pearson"
)
dev.off()

# ------------------------------------------------------------------------------
# SECTION 3: MULTI-PANEL FIGURE LAYOUT COMPOSITION (PATCHWORK)
# ------------------------------------------------------------------------------
# Capturing individual plotting objects into memory matrices for unified publishing
fig_tmb <- gene_TMB_radar("TMEM45A", method = "pearson")
fig_msi <- gene_MSI_radar("TMEM45A", method = "pearson")

# Rendering combined panel plot to evaluate TMB and MSI dynamics side-by-side
pdf("output/figure/combined_TMB_MSI_radar.pdf", width = 12, height = 6)

# Utilizing patchwork syntax to stitch plots horizontally and adding descriptive titles
combined_plot <- fig_tmb + fig_msi + 
  plot_annotation(
    title = "Pan-Cancer Correlation of TMEM45A with Genomic Instability Metrics",
    subtitle = "Analysis of Tumor Mutational Burden (TMB) and Microsatellite Instability (MSI)",
    theme = theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
                  plot.subtitle = element_text(size = 11, italic = TRUE, hjust = 0.5))
  )

print(combined_plot)
dev.off()
