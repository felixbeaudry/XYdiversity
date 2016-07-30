#!/bin/bash -l
#SBATCH -D /home/jhough/projects/rumex/projects/Ydiversity
#SBATCH -o /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code-stdout_%j.txt
#SBATCH -e /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code_stderr_%j.txt
#SBATCH -J sfs
#SBATCH --cpus-per-task=10

set -e
set -u
set -o pipefail


#command structure: sfs_code <Npops> <Niter> [<options> [arguments]]

# Parameters used here
# Npops:        1
# Niter:        50
# theta(-t):    0.001375
# rho(-r):      0
# ploidy(-P):   1
# tau(-TE):     0.3 (scaled in units of P*N generations)
# loci(-L):     2 regions, lengths: 500000, 800000 (<R> <L1> [<L2>..] [R]): R regions with lengths <L1><L2>...
# annotate(-a): N noncoding
# fitness(-W):  L 1 2 0 1 1 0.184 0.003 (here, gamma shape = 0.184, and s=0.01. i.e., 0.184/5000=0.003)
# -A tells simualtion to end
# sampsize(-n): 8 chromosomes per sample
# popsize:(-N)  500

echo "Starting Job: coding regions only"
date

sfs_code 1 50 -r 0 -t 0.001375 -P 1 -TE 0.3 -L 2 500000 800000 \
-a N -W L 1 2 0 1 1 0.184 0.003 -n 8 -N 500 -A \
-o SFS.out --errfile SFS.err

echo "Ending Job: coding regions "
date
