include { FASTQC as FASTQC_RAW }  from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIM } from '../modules/fastqc.nf'
include { CUTADAPT }              from '../modules/cutadapt.nf'
include { BWA_INDEX }             from '../modules/bwa_index.nf'
include { BWA_MEM }               from '../modules/bwa_mem.nf'
include { SAMTOOLS_SORT }         from '../modules/samtools.nf'

workflow TRIM_AND_QC {

    // Input channels
    Channel
        .fromFilePairs("${params.fastq_dir}/*_R{1,2}.fastq.gz", checkIfExists: true, flat: true)
        .set { read_pairs }

    Channel
        .fromPath("${params.fastq_dir}/ref.fa", checkIfExists: true)
        .set { ref_genome }

    // 1. Quality Control (Raw)
    FASTQC_RAW(read_pairs.map{ it[1..2] }.flatten())

    // 2. Adapter Trimming
    trimmed_reads = CUTADAPT(read_pairs)

    // 3. Quality Control (Trimmed)
    FASTQC_TRIM(trimmed_reads.map{ it[1..2] }.flatten())

    // 4. Index Reference Genome
    index_ch = BWA_INDEX(ref_genome)

    // 5. Alignment (BWA MEM)
    // Combine index channel with trimmed reads for alignment
    aligned_sam = BWA_MEM(index_ch, trimmed_reads)

    // 6. Sort and Index BAM
    SAMTOOLS_SORT(aligned_sam)
}
