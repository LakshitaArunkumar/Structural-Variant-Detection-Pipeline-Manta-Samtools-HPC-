## Structural Variant Detection Pipeline (Manta, Samtools, HPC)

This project implements a structural variant (SV) detection pipeline for human sequencing data using Manta and samtools. The workflow extracts chromosome-specific alignments, identifies large structural variants, and processes results for downstream analysis.

---

## Project Overview

Structural variants such as deletions and duplications play an important role in genomic variation and disease. This pipeline processes alignment data to identify structural variants in chromosome 22 and extracts high-confidence events for analysis.

---

## Objectives

- Extract chromosome-specific alignment data  
- Convert and index alignment formats (CRAM/BAM)  
- Detect structural variants using Manta  
- Filter large structural variants (≥1 kb)  
- Generate BED files for downstream analysis  

---

## Workflow Summary

### Data Preparation

- Linked project data directory for efficient access  
- Loaded required bioinformatics tools  

---

### Alignment Extraction

- Extracted chromosome 22 reads from CRAM file  
- Converted to BAM format using samtools  
- Indexed BAM file for downstream processing  

---

### Structural Variant Calling

- Configured Manta workflow for SV detection  
- Ran automated workflow to identify structural variants  
- Generated VCF file containing detected variants  

---

### Variant Filtering

- Extracted:
  - Deletions (DEL)  
  - Duplications (DUP)  

- Filtered variants:
  - Size ≥ 1 kb  

- Converted filtered variants into BED format  

---

### File Conversion

- Converted BAM file back to CRAM format  
- Indexed CRAM file for efficient storage and access  

---

## Technologies Used

- Bash (Unix scripting)  
- SLURM (HPC job scheduling)  
- Samtools  
- Manta  

---

## Key Features

- Structural variant detection pipeline  
- Chromosome-specific data processing  
- Integration of alignment and variant calling tools  
- Filtering of large genomic events  
- Generation of analysis-ready BED files  

---

## Key Skills Demonstrated

- Structural variant analysis  
- NGS data handling (CRAM/BAM formats)  
- Variant filtering and processing  
- HPC workflow execution  
- Pipeline automation using Bash  

---

## Notes

- Structural variants are filtered based on size (≥1 kb)  
- Analysis focuses on chromosome 22 for computational efficiency  
- Output BED file contains genomic coordinates of large CNVs  
- Pipeline is designed for scalable use in HPC environments  

---

## Author

Lakshita Arunkumar
