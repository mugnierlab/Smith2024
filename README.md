# Smith2024
mosaic-vsg-scripts

VSG-AMP-Seq:

1) Raw FASTQ processing
packages required:
```
cutadapt v3.6
trim_galore
```

python packages required:
```
    os
    glob
    shutil
    subprocess
    itertools
    more_itertools
    csv
    contextlib
    pandas
    Bio.SeqIO.QualityIO
    Levenshtein
```

Processing combined FASTQ files:
```
    index_addition.py
        global_target.py
    primer_sort.py
        antat_primers.fasta
    trim.py
        antat_primers.txt
    consol_reads.py
        consol_supplement.py
    demultiplex.py
        <samples>_barcodes.txt
        if error because too many files are open, run:
            ulimit -n <num of files to open> 
```
auxillary scripts and files needed to run above scripts:
```
    antat_primers.fasta
    antat_primers.txt
    <samples>_barcodes.txt
        a file with barcodes specific for your experiment
    aux_functions.py
```

2) mosaic identification

python packages required:
```
    glob
    os
    csv
    contextlib
    Bio.SeqIO.QualityIO
    Levenshtein
    regex
```
Python executables:
```
    genome_sort_by_primer.py
    vsg_align.py
    identify_mosaics.py
```
 auxillary scripts and files needed to run above scripts:
```
    vsg_align_supplement.py
    aux_functions.py
    global_target.py
```
3) Visualization functions

R packages required:
```
    tidyverse
    qPCRr - by Jaclyn Smith
```
R executables:
```
    mosaic_graphing_functions.R
```
