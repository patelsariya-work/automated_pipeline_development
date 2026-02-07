#!/bin/bash
source ~/miniconda/bin/activate
conda activate pipeline
./nextflow run main.nf
