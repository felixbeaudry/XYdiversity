#!/bin/bash -l
#SBATCH -D /home/jhough/projects/rumex/projects/Ydiversity
#SBATCH -o /home/jhough/projects/rumex/projects/Ydiversity/logs/convert-stdout_%j.txt
#SBATCH -e /home/jhough/projects/rumex/projects/Ydiversity/logs/convert_stderr_%j.txt
#SBATCH -J convert_SFS
#SBATCH --cpus-per-task=5

set -e
set -u
set -o pipefail

#see https://github.com/molpopgen/msstats
#command structure: convertSFS CODE <input file> <option [args]> | msstats/src/msstats >out
# used: - for ms style output; T 0 says to output only sysnonymous mutations

convertSFS_CODE SFS.out -m T 0 | msstats/src/.msstats > stats.txt

# Then, using R,
# x=read.table("stats",header=T)
# mean(x$hsm01[x$pop==0])
