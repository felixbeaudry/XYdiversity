import coarse_grained_theory
import recombination_theory

# Asexual population

Ns = 127.67
NU = 1374
NR = 0
n = 6

# for rumex: Ns=127.67, NU=1374 s=6 nruns=10000

# Calculate coarse-grained parameters
Nseff,NUeff,NUneff = coarse_grained_theory.calculate_effective_params(Ns,NU)

print "Original parameters:", Ns,NU,NR
print "Coarse-grained parameters:", Nseff,NUeff,0


# Calculate the shape of the SFS directly
Q = coarse_grained_theory.calculate_Q(Ns,NU,n)

print "Qn(i):", Q