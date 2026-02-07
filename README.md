# Automated Human Genome Pipeline (Project 2)

A robust bioinformatics pipeline for processing paired-end human genome sequencing data. This workflow automates quality control, adapter trimming, alignment, and BAM processing using Nextflow.

## 🚀 Features

-   **Quality Control**: Runs FastQC on both raw and trimmed reads.
-   **Trimming**: Removes adapters using Cutadapt.
-   **Alignment**: Align reads to a reference genome using BWA MEM.
-   **Processing**: Sorts and indexes BAM files with Samtools.
-   **Reproducibility**: Environment managed via Conda.

## 🛠️ Tools Used

-   [Nextflow](https://www.nextflow.io/) - Workflow management
-   [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) - Quality control
-   [Cutadapt](https://cutadapt.readthedocs.io/) - Adapter trimming
-   [BWA](http://bio-bwa.sourceforge.net/) - Alignment
-   [Samtools](http://www.htslib.org/) - BAM manipulation

## 📂 Project Structure

```
automated_pipeline_v2/
├── data/                   # Input FASTQ files and Reference Genome
├── modules/                # Nextflow modules (FastQC, Cutadapt, BWA, Samtools)
├── workflows/              # Workflow definitions
├── results/                # Pipeline outputs (created at runtime)
├── environment.yml         # Conda environment specification
├── nextflow.config         # Configuration settings
├── main.nf                 # Entry point
└── run_pipeline.sh         # Helper script
```

## ⚙️ Setup

### Prerequisites

-   **Conda** (Miniconda or Anaconda)
-   **Git**
-   **Java 11+** (Required for Nextflow)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/patelsariya-work/automated_pipeline_development.git
    cd automated_pipeline_v2
    ```

2.  **Create the Conda Environment:**
    ```bash
    conda env create -f environment.yml
    conda activate pipeline
    ```

## ▶️ How to Run

1.  **Prepare Data:**
    Place your paired-end FASTQ files (`*_R1.fastq.gz`, `*_R2.fastq.gz`) and reference genome (`ref.fa`) in the `data/` directory.

2.  **Execute the Pipeline:**
    You can run the pipeline using the provided helper script:
    ```bash
    bash run_pipeline.sh
    ```
    
    Or directly with Nextflow:
    ```bash
    nextflow run main.nf
    ```

## 📊 Output

All results are saved in the `results/` directory:

-   `results/fastqc/`: Quality control reports (HTML & Zip)
-   `results/trimmed/`: Cleaned FASTQ files
-   `results/reference/`: BWA Index files
-   `results/aligned/`: Sorted BAM files (`*.bam`) and indices (`*.bam.bai`)

## 📝 Configuration

You can adjust paths and parameters in `nextflow.config`:
-   `fastq_dir`: Directory containing input data (Default: `"data"`)
-   `output`: Directory for results (Default: `"results"`)
