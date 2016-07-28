# Population genetics of X and Y chromosomes in _Rumex hastatulus_

This repository stores the code, files, and links to the sequence data used in our project investigating X and Y chromosome evolution and diversity in  _Rumex hastatulus_

## Data access

Here are some links to the data that are stored on the Grandiflora server

#### Reference transcriptomes and genomes
+ _R. hastatulus_ transcriptome: ```/cap1/josh.hough/Rhastatulus.fa```
+ _R. hastatulus_ genome: ```/cap1/josh.hough/```
+ _R. bucephalophorus_ transcriptome: ```/cap1/josh.hough/```

#### _R. hastatulus_ Transcriptome alignments
+ family data: ```/cap1/josh.hough/```
+ population: ```/cap1/josh.hough/```
+ CDS alignments:```/cap1/josh.hough/```

#### Polymorphism (SNP) data
+ family ```/cap1/josh.hough/```
+ Population ```/cap1/josh.hough/```

## Scripts and Software

Software version used in downstream analyses (some of which are modified versions of the originals)

+ Polymorphurama
+ MLHKA
+ SFS_CODE
+ msstats

### Genome alignments, genotype likelihoods, SNP calling
+ BWA alignments : ``BWA-mem.sh``
+ Picard Tools processing: ``Picard.sh``
+ SNP calling with GATK: ``gatk-erc.sh``
+ Genotype discovery:
