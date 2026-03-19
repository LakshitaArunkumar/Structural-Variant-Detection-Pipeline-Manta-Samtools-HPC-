#!/bin/bash
#SBATCH-M teach
#SBATCH-A hugen2072-2025s
#SBATCH --mem-per-cpu=100G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH--mail-user=LAA196@pitt.edu 
#SBATCH -t 00:30:00
set -ve

#Link the p6 file folder to my home directory
ln -s /ix1/hugen2072-2025s/p6/ p6

#Module which is required
module load gcc/8.2.0 samtools/1.12

#Step1: Extract chr 22 from the alignment 
samtools view -T p6/GRCh38_full_analysis_set_plus_decoy_hla.fa \
-bS \
-o NA12778.chr22.bam \
-h p6/NA12778.final.cram chr22

#Step2: Index the file 
samtools index NA12778.chr22.bam

#Step3: Set-up pyhton script and get the output which has the data about the structural variants
python /ihome/crc/install/manta/manta-1.6.0.centos6_x86_64/bin/configManta.py \
--referenceFasta p6/GRCh38_full_analysis_set_plus_decoy_hla.fa \
--bam NA12778.chr22.bam \
--runDir manta_test

#Step4: Run the python script
cd manta_test
python runWorkflow.py

#Step5: Move the results to a different folder
cd results/variants/

#Step6: Extract duplication and deletion variants from the vcf file which has size greater than 1000 (structural variant) and make a bed file out of it
zcat diploidSV.vcf.gz \
| awk '{if ($5 ~ "DEL" || $5 ~ "DUP") print}' \
| awk -F"[\t;]" '{print $1, $2, $8, $5}' OFS="\t" \
| sed 's/END=//g' \
| awk '{if ($3 - $2 >= 1000) print}' > gt1kb.cnv.bed

#Step7: Convert bam to a cram file and index it
cd ~/hugen2072_p6/
samtools view -h -o NA12778.chr22.cram -T p6/GRCh38_full_analysis_set_plus_decoy_hla.fa NA12778.chr22.bam
samtools index NA12778.chr22.cram
