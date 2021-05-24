# %%
# load modules
module load sratoolkit/2.8.2.1

# %%
# download and compress
mkdir fastq
bsub << EOF
#!/bin/bash
#BSUB -o download.out
#BSUB -e download.err
while read SRR
	do
	fastq-dump "$SRR" --split-files --outdir ./fastq/
done < SRR_Acc_List.txt
gzip ./fastq/*.fastq
EOF
