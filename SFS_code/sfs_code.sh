#!/bin/bash -l
#SBATCH -D /home/jhough/projects/rumex/projects/Ydiversity
#SBATCH -o /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code-stdout_%j.txt
#SBATCH -e /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code_stderr_%j.txt
#SBATCH -J sfs
#SBATCH --cpus-per-task=10

set -e
set -u
set -o pipefail

##Josh Hough, UC Davis, July 19, 2016

echo "Starting Job: test1"
date

sfs_code 1 50 -r 0 -t 0.001375 -P 1 -TE 0.3 -L 2 500000 800000 \
-a N -W L 1 2 0 1 1 0.184 0.003 -n 8 -N 500 -A >test1 \
-o test1.out --errfile test1.err

echo "Ending Job: "
date
