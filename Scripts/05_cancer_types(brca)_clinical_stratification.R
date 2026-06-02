
# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 05_BRCA_Cohort_Specific_Clinical_and_Functional_Analysis
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script executes a granular, cohort-specific analysis focusing strictly on 
# Breast Invasive Carcinoma (BRCA). It maps TMEM45A expression against diverse 
# clinical covariates (Age stratification, Gender, and Pathological Stage), performs 
# high-throughput Functional Enrichment (GSEA-GO & GSEA-KEGG) based on TMEM45A 
# expression, and evaluates diagnostic accuracy via Receiver Operating Characteristic (ROC) curves.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing global memory to ensure clean modeling matrices for the BRCA cohort
rm(list = ls())

# Loading target packages verified for cohort-specific stratification
library(TCGAplot)
library(tidyverse)
library(paletteer)

# ------------------------------------------------------------------------------
# SECTION 2: BRCA COHORT DIFFERENTIAL EXPRESSION PROFILING
# ------------------------------------------------------------------------------

# --- SUBSECTION 2.1: COHORT-WIDE TUMOR VS. NORMAL BOXPLOT ---
# Comparing absolute TMEM45A transcript levels between primary BRCA tumors and normal tissues.
pdf("output/figure/TMEM45A_tcga_boxplot.pdf")
tcga_boxplot("BRCA", "TMEM45A")
dev.off()


# --- SUBSECTION 2.2: MATCHED PAIRED TISSUE BOXPLOT ---
# Eliminating confounding genetic variables using strictly patient-matched normal-tumor pairs.
pdf("output/figure/TMEM45A_tcga_paired_boxplot.pdf")
paired_boxplot("BRCA", "TMEM45A")
dev.off()

# ------------------------------------------------------------------------------
# SECTION 3: CLINICAL COVARIATE STRATIFICATION ANALYSIS
# ------------------------------------------------------------------------------

# --- SUBSECTION 3.1: STANDARD AGE STRATIFICATION ---
# Assessing translational variations across default continuous age groups.
pdf("output/figure/gene_age.pdf")
gene_age("BRCA", "TMEM45A")
dev.off()


# --- SUBSECTION 3.2: 3-TIER AGE CUSTOM STRATIFICATION ---
# Partitioning the cohort into early-onset (<40), intermediate (40-60), and late-onset (>60)
# to analyze correlation with pre/post-menopausal clinical windows in breast cancer.
pdf("output/figure/gene_3age.pdf")
gene_3age("BRCA", "TMEM45A", age1 = 40, age2 = 60)
dev.off()


# --- SUBSECTION 3.3: GENDER STRATIFICATION ---
# Exploring phenotypic differences between Female and Male BRCA cases.
pdf("output/figure/gene_gender.pdf")
gene_gender("BRCA", "TMEM45A")
dev.off()


# --- SUBSECTION 3.4: PATHOLOGICAL STAGE CORRELATION ---
# Critical step: Evaluating if TMEM45A expression escalates alongside breast cancer progression
# from early localized stages (Stage I/II) to advanced metastatic disease (Stage III/IV).
pdf("output/figure/gene_stage.pdf")
gene_stage("BRCA", "TMEM45A")
dev.off()

# ------------------------------------------------------------------------------
# SECTION 4: HIGH-THROUGHPUT TRANSCRIPTOMIC ENRICHMENT PIPELINE (GSEA)
# ------------------------------------------------------------------------------

# --- SUBSECTION 4.1: CO-EXPRESSION DEGs MATRIX ---
# Partitioning BRCA samples by TMEM45A median splits to capture associated Differentially Expressed Genes.
pdf("output/figure/gene_deg_heatmap.pdf")
gene_deg_heatmap("BRCA", "TMEM45A")
dev.off()


# --- SUBSECTION 4.2: GENE SET ENRICHMENT ANALYSIS - GENE ONTOLOGY (GSEA-GO) ---
# Functional mapping to trace altered Biological Processes (BP), Cellular Components (CC), 
# and Molecular Functions (MF) driven by high TMEM45A states.
pdf("output/figure/gsea_go.pdf")
gene_gsea_go("BRCA", "TMEM45A")
dev.off()


# --- SUBSECTION 4.3: GSEA - KEGG PATHWAY ENRICHMENT ---
# Identifying active metabolic and oncogenic signaling cascades (e.g., MAPK, PI3K/Akt, Core Immune).
pdf("output/figure/gsea_kegg.pdf")
gene_gsea_kegg("BRCA", "TMEM45A")
dev.off()

# ------------------------------------------------------------------------------
# SECTION 5: CLINICAL TRANSLATION & DIAGNOSTIC ACCURACY
# ------------------------------------------------------------------------------
# Generating Receiver Operating Characteristic (ROC) curve and calculating Area Under Curve (AUC) 
# to quantify the statistical power of TMEM45A to distinguish normal tissue from breast tumor.
pdf("output/figure/tcga_roc.pdf")
tcga_roc("BRCA", "TMEM45A")
dev.off()
