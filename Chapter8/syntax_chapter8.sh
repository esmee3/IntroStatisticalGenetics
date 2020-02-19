#!/bin/bash

###############################################################################################
###################                Syntax Chapter 8       ####################################
###############################################################################################



sh hello_world.sh 

./plink --bfile hapmap-ceu --recode --out hapmap-ceu

./plink --vcf  ALL.chr21.vcf.gz --make-bed --out test_vcf

./plink	--bfile hapmap-ceu \
       	--keep list.txt \
        	--make-bed --out  selectedIndividuals

./plink   	--bfile hapmap-ceu \
        	--snps  rs9930506 \
 		--make-bed \
    		--out  rs9930506sample

head 1kg_EU_qc.fam
head 1kg_EU_qc.bim

head BMI_pheno.txt


./plink   	 --bfile 1kg_EU_qc\
         	 --pheno BMI_pheno.txt \
       	 --make-bed --out 1kg_EU_BMI


./plink --bfile hapmap-ceu  --freq --out Allele_Frequency


head Allele_Frequency.frq 


./plink --bfile hapmap-ceu --missing --out missing_data

head missing_data.imiss

head missing_data.lmiss


./plink     --bfile hapmap-ceu \
        	--filter-females \
    		--make-bed \
		--out hapmap_filter_females



./plink --bfile 1kg_hm3 --mind 0.05 --make-bed --out 1kg_hm3_mind005

./plink --bfile 1kg_hm3 --het --out 1kg_hm3_het

./plink --bfile hapmap-ceu --check-sex --out hapmap_sexcheck 

./plink --bfile 1kg_hm3 --geno 0.05 --make-bed --out 1kg_hm3_geno

./plink --bfile 1kg_hm3 --maf 0.01 --make-bed  --out 1kg_hm3_maf
./plink --bfile 1kg_hm3 --hwe 0.00001 --make-bed  --out 1kg_hm3_hwe



./plink 	--bfile 1kg_hm3 \
		--mind 0.03 \
 		--geno 0.05 \
 		--maf 0.01 \
 	--hwe 0.00001 \
	--exclude individuals_failQC.txt \
 		--make-bed  --out 1kg_hm3_QC