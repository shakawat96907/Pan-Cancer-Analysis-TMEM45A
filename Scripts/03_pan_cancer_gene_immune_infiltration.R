# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 03_Pan_Cancer_Gene_Expression_and_Immune_Correlation
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain969607@gmail.com
# ==============================================================================
# Objective:
# This script maps the intricate crosstalk between TMEM45A expression and the 
# Tumor Microenvironment (TME). It profiles correlations with Immune Checkpoint 
# Genes (ICGs), Chemokines, Receptors, Immunostimulators, Immunoinhibitors, and 
# absolute Immune Cell Infiltration density across TCGA cohorts using Pearson scaling.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Cleaning system memory to maintain script independence and speed
rm(list = ls())

# Loading target packages required for computational immunogenomics matrix operations
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: IMMUNE LANDSCAPE & INTERACTION HEATMAPS
# ------------------------------------------------------------------------------

# --- SUBSECTION 2.1: IMMUNE CHECKPOINT GENES (ICGs) CORRELATION ---
# Evaluates correlation with critical target co-inhibitory/stimulatory receptors 
# (e.g., CD274/PD-L1, CTLA4, HAVCR2/TIM3, LAG3, PDCD1/PD-1, TIGIT) to assess immunotherapy potential.
pdf("output/figure/checkpoint_heatmap.pdf", width = 12, height = 10)

gene_checkpoint_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",      # Negative correlation limit
  highcol     = "red",        # Positive correlation limit
  cluster_row = TRUE,         # Hierarchical clustering on immune genes
  cluster_col = TRUE,         # Hierarchical clustering on cancer cohorts
  legend      = TRUE
)
dev.off()


# --- SUBSECTION 2.2: CHEMOKINE LIGAND CORRELATION ---
# Profiles how TMEM45A alters or associates with secretome-driven tumor trafficking flags.
pdf("output/figure/chemokine_heatmap.pdf", width = 12, height = 10)

gene_chemokine_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",
  highcol     = "red",
  cluster_row = TRUE,
  cluster_col = TRUE,
  legend      = TRUE
)
dev.off()


# --- SUBSECTION 2.3: CHEMOKINE RECEPTOR CORRELATION ---
# Maps matching receptor configurations to explore potential autocrine/paracrine loops.
pdf("output/figure/receptor_heatmap.pdf", width = 11, height = 10)

gene_receptor_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",
  highcol     = "red",
  cluster_row = TRUE,
  cluster_col = TRUE,
  legend      = TRUE
)
dev.off()


# --- SUBSECTION 2.4: IMMUNO_STIMULATOR GENE MODELING ---
# Identifies structural relationships with active immune-promoting ligands and receptors.
pdf("output/figure/immustimulator_heatmap.pdf", width = 12, height = 10)

gene_immustimulator_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",
  highcol     = "red",
  cluster_row = TRUE,
  cluster_col = TRUE,
  legend      = TRUE
)
dev.off()


# --- SUBSECTION 2.5: IMMUNO_INHIBITOR GENE MODELING ---
# Measures association with immunosuppressive markers driving immune evasion.
pdf("output/figure/immunhibitor_heatmap.pdf", width = 12, height = 10)

gene_immuinhibitor_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",
  highcol     = "red",
  cluster_row = TRUE,
  cluster_col = TRUE,
  legend      = TRUE
)
dev.off()


# --- SUBSECTION 2.6: MULTI-ALGOTHIRM IMMUNE CELL INFILTRATION ---
# Tracks actual cellular presence (CD8+ T-cells, Macrophages, Tregs, DCs, etc.) 
# across the TME, consolidating multiple deconvolution engines via TIMER2.0 framework.
pdf("output/figure/immucell_heatmap.pdf", width = 12, height = 10)

gene_immucell_heatmap(
  "TMEM45A",
  method      = "pearson",
  lowcol      = "green",
  highcol     = "red",
  cluster_row = TRUE,
  cluster_col = TRUE,
  legend      = TRUE
)
dev.off()

# ------------------------------------------------------------------------------
# SECTION 3: IMMUNE SCORE TRIANGLE EXPANSION
# ------------------------------------------------------------------------------
# Quantifying global Stromal, Immune, and ESTIMATE scores against TMEM45A expression levels.
pdf("output/figure/immunescore_triangle.pdf")

gene_immunescore_triangle(
  "TMEM45A", 
  method = "pearson"
)
dev.off()
