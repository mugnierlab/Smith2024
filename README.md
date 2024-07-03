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
```
auxillary scripts and files needed to run above scripts:
```
    antat_primers.fasta
    antat_primers.txt
    aux_functions.py
```
    
