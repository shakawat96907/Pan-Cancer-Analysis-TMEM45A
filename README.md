# Comprehensive Pan-Cancer Transcriptomic, Proteomic, and Clinical Genomic Profiling of TMEM45A

🔬 **Project Overview**
This repository hosts the computational architecture, data visualization schemes, and analytical pipelines for the systematic, multi-omic pan-cancer assessment of **TMEM45A** (Transmembrane Protein 45A) across 33 human malignancies using **The Cancer Genome Atlas (TCGA)** and the **Genotype-Tissue Expression (GTEx)** cohorts. 

This study decodes the oncogenic footprint of TMEM45A by integrating differential mRNA/protein expression, promoter methylation dynamics, genetic alterations, tumor microenvironment (TME) immune infiltration matrices, single-cell functional heterogeneity, and pharmacogenomic drug sensitivity landscapes.

---

### 📂 Repository Structure

*📂 Scripts/ : 10 structured R scripts containing the core transcriptomic pipelines alongside `setup.R` for high-throughput environment initialization.
*📂 Figures/ : Publication-quality multi-omic figures (Differential expression charts, Kaplan-Meier curves, Forest plots, and TMB/MSI radar graphs).
*📂 Data/    : Curated metadata tables, cohort acronym guides, and intersecting gene matrices.

---

### 🗂️ Project Architecture & Analysis Modules

The entire workflow is systematically partitioned into the following 13 functional modules, tracking the multi-omic and clinical investigation of TMEM45A:

#### 1. Gene Expression Analysis (mRNA Level)
* Assessment of TMEM45A mRNA expression levels between tumor and adjacent normal tissues across multiple cancer types using the "Gene DE" module of **TIMER 2.0**.
* Cross-validation of expression profiles and validation across pathological clinical stages using **GEPIA2** (utilizing combined TCGA and GTEx datasets).
* Secondary transcriptomic differential validation using the **UALCAN** database.

#### 2. Proteomics Analysis
* Characterization of translational TMEM45A protein expression disparities between tumor and normal pairs across 14 tumor cohorts.
* Data mined from the Clinical Proteomic Tumor Analysis Consortium (**CPTAC**) and the International Cancer Proteogenome Consortium (**ICPC**) via the UALCAN portal.

#### 3. Survival Analysis
* Evaluation of global prognostic parameters including Overall Survival (OS) and Disease-Free Survival (DFS) across 33 TCGA cancers via **GEPIA2**.
* Group cutoffs configured at the 50% median threshold to map survival significance landscapes.

#### 4. DNA Methylation Analysis
* Epigenetic profiling focusing on TMEM45A gene promoter methylation indices in tumor vs. normal controls via **UALCAN**.
* Fine-resolution mapping of CpG-aggregated methylation clusters and individual CpG site architectures using the **SMART** engine.

#### 5. Gene Alteration Analysis
* Extraction of mutational landscapes including alteration frequencies, copy-number alterations (CNVs), mutation types, and specific amino acid alteration sites.
* Visualized via **cBioPortal** utilizing the TCGA Pan-Cancer Atlas dataset resources.

#### 6. Cox Regression Analysis
* Implementation of **Univariate Cox Proportional Hazards Regression Models** to compute Hazard Ratios (HR) and 95% Confidence Intervals (CI) across oncology cohorts.
* Executed in the R environment (`v4.5.2`) using the `TCGAplot (v8.0.0)` package  (https://github.com/tjhwangxiong/TCGAplot) and rendered into publication-ready **Forest Plots**.

#### 7. Immune Infiltration Analysis
* Deconvolution of cellular fractions within the Tumor Microenvironment (TME) using the **EPIC** algorithm integrated within **TIMER2.0**.
* Correlated TMEM45A transcription with key infiltrating elements including Cancer-Associated Fibroblasts (CAFs), CD8+ T cells, and NK cells.

#### 8. TMB and MSI Analysis
* Correlation analysis evaluating TMEM45A expression against **Tumor Mutation Burden (TMB)** and **Microsatellite Instability (MSI)** across TCGA datasets.
* Computed via Pearson correlation and dynamically projected onto unified **Radar Plots** via the R package `TCGAplot`.

#### 9. Global Microenvironment & Immune Checkpoint Analysis
* Global screening mapping the correlation between TMEM45A expression levels and global immune/stromal scoring indices.
* Deep correlation profiling against core **Immune Checkpoints** and immunoregulartory machineries using `TCGAplot`.

#### 10. Immunostimulatory Networks & Downstream Axis
* Profiling of downstream gene clusters network pathways, focusing on immunoinhibitory and immunostimulatory interactions.
* Modeled in R to decode how TMEM45A triggers downstream immune regulatory axes.

#### 11. Single-cell Functional Analysis
* Cellular-level interrogation of TMEM45A distribution across distinct cell major-lineages (immune and stromal compartments) within the microenvironment.
* Queried using the "Gene Exploration" module of **Tumor Immune Single-cell Hub 2 (TISCH2)** across specific tracks (BRCA, BLCA, CHOL, KIRC, LIHC, OV, STAD, SKCM, SARC, PAAD, UVM, UCEC).

#### 12. Drug Sensitivity Analysis
* Interfacing transcriptomic variants of TMEM45A against pharmacological compound efficacy data from the **GDSC** and **CTRP** networks.
* Deployed using the **Gene Set Cancer Analysis (GSCA)** platform to map potential small-molecule drug therapeutic sensitivities or resistances.

#### 13. Gene Enrichment Analysis
* **Interactome Map:** Construction of a functional Protein-Protein Interaction (PPI) grid mapping the top 50 TMEM45A binding targets via **STRING (v12.0)**.
* **Co-expression Axis:** Extraction of the top 100 positively correlated genomic targets via GEPIA2, with Venn intersection analysis handled by **InteractiVenn**.
* **Pathway Cascades:** Functional annotation via **Enrichr** to map Gene Ontology (GO: BP, CC, MF) and pathway systems (**KEGG**, **Reactome**, **WikiPathways**).

---

### 🛠️ Computational Framework & Prerequisites
* **Language Environment:** R (v4.5.2) 
* **Primary Libraries:** `TCGAplot (v8.0.0)`  (https://github.com/tjhwangxiong/TCGAplot), `survival`, `survminer`, `ggplot2`, `DESeq2`, `tidyverse`
* **Statistical Thresholding:** Wilcoxon Test (TIMER2.0); ANOVA/t-tests (UALCAN); Spearman/Pearson correlation mapping (GEPIA2/TCGAplot). Significance established strictly at $p < 0.05$.


---
### 📜 Declarations & Contact
* **Author:** Md. Shakawat Hossain  
* **Affiliation:** Department of Biochemistry and Molecular Biology, Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh.  
* **Correspondence:** [shakawathossain96907@gmail.com](mailto:shakawathossain96907@gmail.com)
* **Professional Networks:** [LinkedIn Profile](https://www.linkedin.com/in/md-shakawat-hossain-372143378/) | [ORCID Profile](https://orcid.org/0009-0008-5050-2275)


---
*Maintained by Md. Shakawat Hossain. For collaboration, data requests, or inquiries regarding the corresponding molecular oncology manuscript, reach out via E-mail, LinkedIn or ResearchGate.*
