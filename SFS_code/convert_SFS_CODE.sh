#!/bin/bash -l
#SBATCH -D /home/jhough/projects/rumex/projects/Ydiversity
#SBATCH -o /home/jhough/projects/rumex/projects/Ydiversity/logs/convert-stdout_%j.txt
#SBATCH -e /home/jhough/projects/rumex/projects/Ydiversity/logs/convert_stderr_%j.txt
#SBATCH -J convert_SFS
#SBATCH --mem-per-cpu=5G
#SBATCH --cpus-per-task=1

set -e
set -u
set -o pipefail

#command structure: convertSFS_CODE [commands] | msstats/src/msstats >out
# used: - for ms style output T 0 says to output sysnonymous mutations

convertSFS_CODE -m T 0 | msstats/src/.msstats > output.txt

# Then, using R,
# x=read.table("output",header=T)
# mean(x$hsm01[x$pop==0])
