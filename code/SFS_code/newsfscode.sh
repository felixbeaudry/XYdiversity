#Purifying Selection

./sfs_code 2 1000 -N 740 -t 0.008 -r 0.0008 -n %d-W %s TE 0.40

#Where,%d and %s are substitutions for the sample size and selection coefficients.

#a)Sample size%d = (5, 50, 500, 5000)

#b)Selection coefficients
  i)Neutral mutation %s:‘0’
  ii)Purifying selection
    (%s):
    -|Υ|:"L 0 2 0 0.0 1.0 0.206 0.0004931"
    -|Υ|*0.1:"L 0 2 0 0.0 1.0 0.206 0.004931"
    -|Υ|*0.025:"L 0 2 0 0.0 1.0 0.206 0.0197240"
    -|Υ|*0.01:"L 0 2 0 0.0 1.0 0.206 0.04931"3
    -|Υ|*0.005:"L 0 2 0 0.0 1.0 0.206 0.0986200"
    -|Υ|*0.0025:"L 0 2 0 0.0 1.0 0.206 0.1972400"
    -|Υ|*0.001:"L 0 2 0 0.0 1.0 0.206 0.4931"
    -|Υ|*0.0001:"L 0 2 0 0.0 1.0 0.206 4.931"

iii)Positive selection (%s):
|Υ|:"L 0 2 1.0 0.206 0.0004931 0.206 0.0004931"
|Υ|*0.1:"L 0 2 1.0 0.206 0.004931 0.206 0.004931"
|Υ|*0.025:"L 0 2 1.0 0.206 0.0197240 0.206 0.0197240"
|Υ|*0.01:"L 0 2 1.0 0.206 0.0493100 0.206 0.0493100"
|Υ|*0.005:"L 0 2 1.0 0.206 0.0986200 0.206 0.0986200"
|Υ|*0.0025:"L 0 2 1.0 0.206 0.1972400 0.206 0.1972400"
|Υ|*0.001:"L 0 2 1.0 0.206 0.4931 0.206 0.4931"
|Υ|*0.0001:"L 0 2 1.0 0.206 4.931 0.206 4.931"

iv)Mixture of negative selection and positive selection (%s)
-|Υ|*0.1 and|Υ|*0.1: "L 0 1 41.77652 %n %p"
where, %n = (0.10, 0.20, ..., 1.00) istheproportion of sites underpurifying selection,
%p= (0.0, 0.02,..., 0.10)istheproportion of sites under positive selection,
and%n + %p = 1.The same gamma distribution is used for bothnegative and positive selection.

Note: Υ is the'baseline' model of distribution of selection coefficients as  inferred by Boyko  et  al(Boyko  et  al.2008), where α=  0.206 and β=  1/2740.

Undereach  combination  of demographicp arameters and selection coefficients, 100 sets of sequences were generated for compiling SFS and computing the mean and variance off estimates.

sfscode 1 1 -t 9.959e-06 -Z -r 0.008 -N 5000 -n 10 -L 3 1e5 1e3 1e5 \-a N R -v L 0 4.41e-4 -v L 1 2.0 -v L 2 4.41e-4 -W L 0 1 1e3 1 0 -W L 2 1 1e310
