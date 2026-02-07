# Automated Human Genome Pipeline (Project 2)

This pipeline processes paired-end human genome sequencing data using FastQC, Cutadapt, BWA, and Samtools.

## Tools Used
-   **Nextflow**: Workflow management
-   **FastQC**: Quality control
-   **Cutadapt**: Adapter trimming
-   **BWA**: Alignment to reference genome
-   **Samtools**: BAM sorting and indexing

## Setup
1.  **Clone the repository:**
    ```bash
    git clone <your-repo-url>
    cd automated_pipeline_v2
    ```

2.  **Create Candidate Environment:**
    Ensure you have Conda installed. Then run:
    ```bash
    conda env create -f environment.yml
    conda activate pipeline
    ```

## How to Run
The pipeline comes with a helper script to set up the environment and run the workflow:

```bash
bash run_pipeline.sh
```

## Output
Results are stored in the `results/` directory:
-   `results/fastqc/`: Quality reports (Raw and Trimmed)
-   `results/trimmed/`: Trimmed FASTQ files
-   `results/reference/`: BWA Index files
-   `results/aligned/`: Sorted BAM files and indices
