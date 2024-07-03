# Smith2024
mosaic-vsg-scripts

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
```
auxillary scripts and files needed to run above scripts:
```
    antat_primers.fasta
    antat_primers.txt
    <samples>_barcodes.txt
        a file with barcodes specific for your experiment
    aux_functions.py
```
    
