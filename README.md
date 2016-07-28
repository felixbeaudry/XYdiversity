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

#### Sex-linked and autosomal gene lists

XYgenes.list.txt

## Scripts and Software

Modified versions of software versions used in downstream analyses:

+ [Polymorphurama](https://github.com/houghjosh/XYdiversity/tree/master/Polymorphurama_modified)
+ [MLHKA](https://github.com/houghjosh/XYdiversity/tree/master/MLHKA_modified)

Links to other software used. Bash scripts with our commands are [here](https://github.com/houghjosh/XYdiversity/tree/master/SFS_code)

+ [SFS_CODE](http://sfscode.sourceforge.net/SFS_CODE/index/index.html)
+ [msstats](https://github.com/molpopgen/msstats)

### Genome alignments, genotype likelihoods, SNP calling
+ BWA alignments : ``BWA-mem.sh``
+ Picard Tools processing: ``Picard.sh``
+ SNP calling with GATK: ``gatk-erc.sh``
+ Genotype discovery:
