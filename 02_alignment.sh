# %%
# load modules
module load bwa/0.7.17
module load samtools/1.3.1

# %%
# alignment
mkdir bam
JOBNAME=bwamem
REF=fasta/PGSC_DM_v4.03_pseudomolecules_ALL.fasta
for r1 in fastq/*_1.fastq.gz
do
name=$(basename $r1 _1.fastq.gz)
r2=fastq/"$name"_2.fastq.gz
bam=bam/"$name".bam
command="bwa mem -R '@RG\tID:$name\tSM:$name\tPL:Illumina' $REF $r1 $r2 | samtools sort - -o $bam"
echo "$command"
done | asub -c 40 -j "$JOBNAME"

# %%
# index
JOBNAME=samtoolsindex
for file in bam/*.bam
do
command="samtools index $file"
echo "$command"
done | asub -c 40 -j "$JOBNAME"
