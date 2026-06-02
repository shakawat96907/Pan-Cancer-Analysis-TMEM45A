# ==============================================================================
# PROJECT: TMEM45A Pan-Cancer Computational Oncogenomics Analysis
# SCRIPT: 00_Environment_Setup & Reproducible Framework (setup.R)
# AUTHOR: Md. Shakawat Hossain
# AFFILIATION: Dept. of Biochemistry & Molecular Biology, SUST, Bangladesh
# E-email: shakawathossain96907@gmail.com
# ==============================================================================
# Objective:
# This foundational script initializes the local project library, manages multi-core
# installation, handles environment virtualization using 'renv', and installs 
# all critical CRAN, Bioconductor, and external GitHub packages (e.g., TCGAplot)
# required for the downstream TMEM45A multi-omics pipelines.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: GLOBAL CONFIGURATION & OPTIMIZATIONS
# ------------------------------------------------------------------------------
# Directing R to fetch from cloud mirror and optimizing compilation speed
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Accelerating execution by mapping multiple logical CPU cores minus one for background tasks
options(Ncpus = max(1L, parallel::detectCores() - 1L))

# Preventing staged installation errors common across certain Windows storage blocks
Sys.setenv(R_INSTALL_STAGED = "false") 

# ------------------------------------------------------------------------------
# SECTION 2: VIRTUAL ENVIRONMENT PACKAGING VIA RENV
# ------------------------------------------------------------------------------
# Ensuring project reproducibility. Isolating library from global R environment interference.
if (!requireNamespace("renv", quietly = TRUE)) {
  message("--> Installing 'renv' to control pipeline dependencies...")
  install.packages("renv")
}

# Initializing or activating isolated environment space
if (!file.exists("renv/activate.R")) {
  message("--> Initializing new renv profile with native Bioconductor alignment...")
  renv::init(bioconductor = TRUE, bare = TRUE)  # Configures project-specific local library
} else {
  message("--> Loading existing project-specific renv architecture...")
  source("renv/activate.R")
}

# Locking Bioconductor infrastructure version for multi-cohort alignment (TCGA/GEO)
renv::settings$bioconductor.version("3.21")

# ------------------------------------------------------------------------------
# SECTION 3: CORE TARGET PACKAGES DEFINITION (CRAN & BIOC)
# ------------------------------------------------------------------------------
# Compiling comprehensive library vector derived from operational downstream code dependencies
cran_packages <- c(
  "tidyverse", "ggpubr", "magrittr", "dplyr", "tibble", "stringr", 
  "reshape2", "psych", "circlize", "fmsb", "survival", "survminer", 
  "forestplot", "pROC", "tinyarray", "ggplot2", "patchwork", "ggsci", 
  "RColorBrewer", "pheatmap", "remotes", "paletteer", "magick"
)

bioc_packages <- c(
  "TCGAbiolinks", "maftools", "ComplexHeatmap", "edgeR",
  "org.Hs.eg.db", "clusterProfiler", "enrichplot", "GSVA", "limma"
)

# Stripping base-R structural packages and deduplicating vectors
cran_packages <- unique(setdiff(cran_packages, c("grid")))
bioc_packages <- unique(bioc_packages)
all_pkgs <- unique(c(cran_packages, bioc_packages))

# ------------------------------------------------------------------------------
# SECTION 4: AUTOMATED CROSS-PLATFORM INSTALLATION ENGINE
# ------------------------------------------------------------------------------
message("--> Verifying dependencies and initiating clean parallel installation...")

# Filtering out modules that are already locked inside the local project library
to_install <- setdiff(all_pkgs, rownames(installed.packages(lib.loc = .libPaths()[1])))

if (length(to_install) > 0) {
  message("--> Installing remaining CRAN/Bioc dependencies: ", paste(to_install, collapse = ", "))
  renv::install(to_install, prompt = FALSE)
} else {
  message("--> All baseline CRAN and Bioconductor prerequisites are up to date.")
}

# ------------------------------------------------------------------------------
# SECTION 5: FALLBACK MECHANISM & INTEGRITY VERIFICATION
# ------------------------------------------------------------------------------
# Performing quiet package checking to capture broken compilation locks
failed <- all_pkgs[!vapply(all_pkgs, function(p) requireNamespace(p, quietly = TRUE), logical(1))]

if (length(failed) > 0) {
  message("--> [WARNING] Retrying failed packages: ", paste(failed, collapse = ", "))
  renv::install(failed, prompt = FALSE)
  
  # Final assert block to ensure downstream scripts don't break
  failed_final <- failed[!vapply(failed, function(p) requireNamespace(p, quietly = TRUE), logical(1))]
  if (length(failed_final) > 0) {
    stop("Critical installation failure encountered for: ", paste(failed_final, collapse = ", "))
  }
}

# ------------------------------------------------------------------------------
# SECTION 6: TARGETED BINARY EXTRACTION - TCGAPLOT FROM GITHUB RELEASES
# ------------------------------------------------------------------------------
# Setting source target URL for structural pan-cancer plotting architecture
tcga_url <- "https://github.com/tjhwangxiong/TCGAplot/releases/download/v8.0.0/TCGAplot_8.0.0.zip"

install_tcgaplot <- function(url) {
  if (requireNamespace("TCGAplot", quietly = TRUE)) {
    return(message("--> 'TCGAplot' already successfully integrated into environment."))
  }
  
  is_windows <- identical(tolower(Sys.info()[["sysname"]]), "windows")
  ok <- FALSE
  
  # Execution Step 1: Default renv install execution
  try({
    renv::install(url, prompt = FALSE)
    ok <<- requireNamespace("TCGAplot", quietly = TRUE)
  }, silent = TRUE)
  
  # Execution Step 2: Windows native pre-compiled binary setup fallback
  if (!ok) {
    if (is_windows && grepl("\\.zip$", url, ignore.case = TRUE)) {
      message("--> Running Windows binary override for prebuilt TCGAplot zip extraction...")
      utils::install.packages(url, repos = NULL, type = "win.binary")
      ok <- requireNamespace("TCGAplot", quietly = TRUE)
    } else {
      # Execution Step 3: Global source fallback utilizing 'remotes'
      if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
      remotes::install_url(url, upgrade = "never")
      ok <- requireNamespace("TCGAplot", quietly = TRUE)
    }
  }
  
  if (!ok) stop("--> CRITICAL ERROR: Integration of TCGAplot package failed.")
}

message("--> Initializing compilation for TCGAplot (Release v8.0.0)...")
install_tcgaplot(tcga_url)

# ------------------------------------------------------------------------------
# SECTION 7: LOCKFILE SNAPSHOT & FINALIZATION
# ------------------------------------------------------------------------------
# Locking the final state of the working directory environment to renv.lock file
message("--> Finalizing system state. Recording versions into 'renv.lock'...")
renv::snapshot(prompt = FALSE)
message("==============================================================================")
message("--> ENVIRONMENT SETUP SUCCESSFUL! Your workspace is now complete and locked.")
message("==============================================================================")



