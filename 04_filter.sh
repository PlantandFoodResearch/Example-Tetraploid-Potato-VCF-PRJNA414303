# %%
# load modules
module load bcftools/1.12
module load tabix/0.2.6

# %%
# filter so that at least one sample has >= 10 depth
INVCF=vcf/PRJNA414303.CHR5.vcf.gz
OUTVCF=vcf/PRJNA414303.CHR5.filterDP10.vcf.gz
bsub << EOF
#!/bin/bash
#BSUB -o filter-dp10.out
#BSUB -e filter-dp10.err
bcftools filter -i'FMT/DP>9' $INVCF | bgzip > $OUTVCF
EOF

