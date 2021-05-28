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


# %%
# filter sites with any null calls
INVCF=vcf/PRJNA414303.CHR5.vcf.gz
OUTVCF=vcf/PRJNA414303.CHR5.filterNullGT.vcf.gz
bsub << EOF
#!/bin/bash
#BSUB -o filter-null-gt.out
#BSUB -e filter-null-gt.err
bcftools filter -e 'FMT/GT ="."' $INVCF | bgzip > $OUTVCF
EOF


# %%
# filter mixed ploidy vcf so that at least one sample has >= 10 depth
INVCF=vcf/PRJNA414303.CHR5.mixed.vcf.gz
OUTVCF=vcf/PRJNA414303.CHR5.mixed.filterDP10.vcf.gz
bsub << EOF
#!/bin/bash
#BSUB -o filter-mixed-dp10.out
#BSUB -e filter-mixed-dp10.err
bcftools filter -i'FMT/DP>9' $INVCF | bgzip > $OUTVCF
EOF


# %%
# filter sites with any null calls in mixed ploidy vcf
INVCF=vcf/PRJNA414303.CHR5.mixed.vcf.gz
OUTVCF=vcf/PRJNA414303.CHR5.mixed.filterNullGT.vcf.gz
bsub << EOF
#!/bin/bash
#BSUB -o filter-mixed-null-gt.out
#BSUB -e filter-mixed-null-gt.err
bcftools filter -e 'FMT/GT ="."' $INVCF | bgzip > $OUTVCF
EOF
