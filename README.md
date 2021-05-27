# Tetraploid potato cross PRJNA414303 

Variant calls from capture-GBS data of chromosome 5 of a 4x bi-parental cross of *Solanum tuberosum*.
Variant calling pipeline was kept simple with minimal QC or filtering to produce a rough example VCF for testing IO.

## Contributors

Thanks to:

- Samantha Baldwin
- Katrina Monaghan
- Susan Thomson

for producing and publishing the sequencing data.

## Metadata

- **NCBI BioProject:** [PRJNA414303](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA414303)
- **NCBI SRR sample list:** [SRR_Acc_List.txt](SRR_Acc_List.txt)
- **NCBI SRA sample data:** [SraRunTable.csv](SraRunTable.csv)
- **Reference Genome:** [PGSC v4.03](http://solanaceae.plantbiology.msu.edu/pgsc_download.shtml)
  - Note: Reference genome includes unanchored regions (`ST4.03ch00`)

## Software

- `sratoolkit/2.8.2.1`
- `samtools/1.3.1`
- `bwa/0.7.17`
- `freebayes/1.3.4`
- `bcftools/1.12`
- `tabix/0.2.6`

## Scripts

- **Download data:** [`01_download.sh`](01_download.sh)
- **Align Reads:** [`02_alignment.sh`](02_alignment.sh)
- **Call variants:** [`03_calling.sh`](03_calling.sh)
- **Filtering:** [`04_filter.sh`](04_filter.sh)

## Output VCFs

- **Raw variant calls:** `PRJNA414303.CHR5.vcf.gz`
- **Filtered to depth >= 10 in 1 or more samples:** `PRJNA414303.CHR5.filterDP10.vcf.gz`

