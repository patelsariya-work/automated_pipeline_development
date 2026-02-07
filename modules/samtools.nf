process SAMTOOLS_SORT {
    publishDir "${params.output}/aligned", mode: 'copy'

    input:
    tuple val(sample_id), path(sam_file)

    output:
    tuple val(sample_id), path("${sample_id}.sorted.bam"), path("${sample_id}.sorted.bam.bai")

    script:
    """
    ${params.samtools_bin} view -bS ${sam_file} | \
    ${params.samtools_bin} sort -o ${sample_id}.sorted.bam
    ${params.samtools_bin} index ${sample_id}.sorted.bam
    """
}
