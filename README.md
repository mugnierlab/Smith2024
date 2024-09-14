# Smith2024
identifying mosaic VSGs

VSG-AMP-Seq: A detailed Readme can be found within the VSG-AMP-Seq Folder. A vignette is included.

Figures: all code used to generate figures is present in each subfolder. Relevant data needed to generate the figures is also present.

VSG_clustering: two alternative clustering methods were used to cluster VSGs into families. The code used to obtain these clusters and the resulting clustered outputs are in this folder.

VSgnome_analysis: Additional VSG-encoding genes were identified in the 2018 Lister Genome (Müller et al., 2018 Nature).
    ```
    genome_VSG_analysis.py
    ```
This script runs the pipeline - many large data files were organized into folders with paths relative to the working directory containing the scripts. Most data files are found on TriTrypDB.com. ABEX7_all_orfs.fa is from Beaver et al. 2024. All data files can be provided upon request, but are too large for upload onto github.

aux_scripts: Additional scripts used to convert .ab1 files into fastqs and for FASTA processing

genomic_sketch_R: the functions used to plot the genome in R. \
libraries required: tidyverse

tissue_ORF_analysis: the python script used to quickly identify ORFs from Beaver et al. 2024 which were AnTat1.1 mosaics\
requires bowtie() \
The output of this analysis is formatted for R functions from VSG-AMP-Seq. Unknown mosaic VSGs with an identified portion matching AnTat1.1 were parsed by hand.

all_Lister_cut_clones.fastq - a FASTQ file with all the full length VSG sequences from the individually isolated clones after guide induction in Lister427 cells targeting VSG-2.

all_mosaic_clones.fastq - a FASTQ file with all the full length VSG sequences from the individually isolated clones after guide induction in EATRO1125 cells targeting VSG AnTat1.1.
