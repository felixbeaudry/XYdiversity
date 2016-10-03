#!/bin/bash -l
#SBATCH -D /home/jhough/projects/rumex/projects/Ydiversity
#SBATCH -o /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code-stdout_%j.txt
#SBATCH -e /home/jhough/projects/rumex/projects/Ydiversity/logs/sfs_code_stderr_%j.txt
#SBATCH -J sfs
#SBATCH --cpus-per-task=10

set -e
set -u
set -o pipefail

# Npops:        1 #number of pops
# Niter:        50 #iterations
# theta(-t):    0.001375 #=1/4 autosomal theta: 0.0055/4
# rho(-r):      0
# ploidy(-P):   1
# tau(-TE):     0.3 #generations scaled in units of P*N (this seems too small?)
# loci(-L):     2 <500000> <800000> #2 regions with lengths <L1><L2>...
# annotate(-a): N #noncoding
# fitness(-W):  L 1 2 0 1 1 0.258 0.005 # Gamma T model. probability positive s = 0, gamma shape = 0.258 from the DFE for x-linked genes. For a selection coefficient = 0.01, the scale parameter is 0.258/(0.01 * 5000)= 0.005.
# sampsize(-n): 8 #chromosomes per sample
# popsize:(-N)  5000
# -A tells simulation to end

./sfs_code 1 50 -r 0 -t 0.001375 -P 1 -TE 0.3 -L 2 500000 800000 \
-a N -W L 1 2 0 1 1 0.184 0.003 -n 8 -N 500 -A
# set paramters as bash variables
aN=0.2579 #shape parameter from X-linked DFE
s=
lN=${aN}/${s}*5000 # scale parameter. Hold aN constant, test a range for s. 5000=5kb

#############################################################################
echo "Starting Job: Non-coding regions"
date

cmd="./sfs_code 1 50 -r 0 -t 0.001375 -P 1 -TE 0.3 -L 2 500000 800000 \
-a N -W L 1 2 0 1 1 0.258 0.005 -n 8 -N 5000 -A \
-o SFS.out --errfile SFS.err"

echo $cmd
eval $cmd
echo "Ending Job: Non-coding regions "
date

# fitness model in SFS_code
# -W [P <pop>] [L <locus>] [H <type> [args]] [*F <alleleFreq> \
# [w] [T [R <minFreq> <maxFreq> [S] [A [G <gens>]] [M <maxReps>]] \
# [F [a] <file>]]] <type> [args]
#
# pop=1 (only 1)
# L=1 (locus 1)
# type=2 (gamma T)
# p.pos=0 (probability positive)
# aP=1
# lP=1 (mean aP/lP, var =aP/lP^2) <-- only used for beneficial mutations. Here, p.pos=0, so irrelevant
# aN=0.184 (k=shape parameter)
# lN=0.003 (theta=scale parameter) where ${lN}=0.184/($0.01*5000)