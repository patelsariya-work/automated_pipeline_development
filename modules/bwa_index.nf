process BWA_INDEX {
    publishDir "${params.output}/reference", mode: 'copy'

    input:
    path ref_genome

    output:
    tuple path(ref_genome), path("${ref_genome}.*")

    script:
    """
    ${params.bwa_bin} index ${ref_genome}
    """
}
