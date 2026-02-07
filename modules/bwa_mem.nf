process BWA_MEM {
    publishDir "${params.output}/aligned", mode: 'copy'

    input:
    tuple path(ref), path(index_files)
    tuple val(sample_id), path(read1), path(read2)

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    ${params.bwa_bin} mem ${ref} ${read1} ${read2} > ${sample_id}.sam
    """
}
