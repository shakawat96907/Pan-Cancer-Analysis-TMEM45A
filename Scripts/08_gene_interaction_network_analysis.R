# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 08_Gene_Interaction_Network_and_KEGG_Pathway_Enrichment
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-mail: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This script evaluates the mechanistic network framework of TMEM45A by analyzing 
# a curated panel of functionally relevant downstream oncogenic and metastatic genes 
# (isolated via comprehensive literature review). It maps Gene Ontology (GO) interaction 
# networks and executes KEGG Pathway Hypergeometric Enrichment analysis using clusterProfiler.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: ENVIRONMENT CLEANUP & DEPENDENCIES LOADING
# ------------------------------------------------------------------------------
# Flushing memory slots to isolate character and factor matrices from survival analysis
rm(list = ls())

# Loading target core suites and Bioconductor functional annotation systems
library(TCGAplot)
library(tidyverse)
library(paletteer)
library(clusterProfiler)
library(org.Hs.eg.db)

# ------------------------------------------------------------------------------
# SECTION 2: GENE ONTOLOGY (GO) NETWORK MAPPING
# ------------------------------------------------------------------------------
# Curating target vector including cell adhesion, epithelial-mesenchymal transition (EMT), 
# and core pro-inflammatory cytokine drivers linked to TMEM45A mechanics.
network_genes <- c(
  "LAMA3", "LAMC2", "TNC", "OSMR", "ITGA6", "ITGB4", "COL17A1", "CXCL8", "IL6"
)

# Rendering the structural biological network interaction layout
pdf("output/figure/gsea_go.pdf", width = 8, height = 8) # Aligned with local folder taxonomy

gene_network_go(
  network_genes
)

dev.off()

# ------------------------------------------------------------------------------
# SECTION 3: KEGG PATHWAY ENRICHMENT MODELING (HIGH-THROUGHPUT DOTPLOT)
# ------------------------------------------------------------------------------
# Expanding the core vector to encompass critical extracellular matrix (ECM) remodelers 
# and advanced invasion signaling cascades (e.g., MMP9, VIM, FN1, SPP1).
kegg_target_genes <- c(
  "LAMA3", "LAMC2", "TNC", "OSMR", "ITGA6", "ITGB4", "COL17A1",
  "CXCL8", "IL6", "MMP9", "VIM", "FN1", "SPP1", "ITGA5", "ITGB1"
)

# Execution Step 3.1: Converting HGNC Gene Symbols to Entrez Identifiers for KEGG mapping
entrez_conversion <- bitr(
  kegg_target_genes,
  fromType = "SYMBOL",
  toType   = "ENTREZID",
  OrgDb    = org.Hs.eg.db
)

# Execution Step 3.2: Launching Over-Representation Analysis (ORA) against Kyoto Encyclopedia
ek <- enrichKEGG(
  gene         = entrez_conversion$ENTREZID,
  organism     = "hsa",         # Homo sapiens specific pathway index
  pvalueCutoff = 0.05
)

# CRITICAL DE-OBFUSCATION STEP: 
# Translating downstream Entrez IDs inside the core enrichment slots back into highly 
# readable standard Gene Symbols to ensure clear reviewer data interpretation.
ek <- setReadable(
  ek,
  OrgDb   = org.Hs.eg.db,
  keyType = "ENTREZID"
)

# Execution Step 3.3: Generating high-impact functional dotplot
pdf("output/figure/KEGG_dotplot.pdf", width = 7, height = 6)

dotplot(
  ek, 
  showCategory = 10             # Restricting view to top 10 highly significantly enriched signaling hubs
)

dev.off()
