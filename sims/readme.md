## Simulating Hill-Robertson Interference during Y-chromosome evolution

### 1. Neutral simulations
We’ll start with a basic neutral simulation that models a genomic region of length **100 kb** in a population of **1000 diploid individuals** (500 Y chromosomes), evolving over **10,000 generations**. Neutral mutations occur uniformly at a rate of **10-7 per bp per generation**.

Note that when modeling the Y chromosome, individuals can only possess zero or one copy of a given mutation, since males possess one Y and females possess none. For this reason, we don't need to use a dominance coefficient in this case; SLiM doesn't use it. The selection coefficient of the mutation determines its fitness effect, and the dominance coefficient supplied in the mutation type will be ignored.

Also, since we are modeling Y chromosomes (specified using the `initializeSex("Y");` callback), the X chromosome is handled by SLiM as a “null chromosome”; it exists essentially only for diploid book-keeping (see [`SLiM_Manual.pdf`](http://benhaller.com/slim/SLiM_Manual.pdf)).


```R
// neutral simulation of Y chromosome evolution
initialize()
{
	// set the overall mutation rate per base position per generation
	initializeMutationRate(1e-7);

	// define mutation types
	// "m1"=neutral, 0.5=dominance (ignored), f=fixed dfe, 0=s
	initializeMutationType("m1", 0.5, "f", 0.0);

	// define genomic element type
	// this creates a new genomic element type. A genomic element type represents a particular type of chromosomal region – introns, exons, UTRs, etc. Here, "g1" is defined as using mutation type m1 for all of its mutations (as specified by the proportion 1.0, the third parameter)
	initializeGenomicElementType("g1", m1, 1.0);

	// Initialize a uniform chromosome of length 100 kb
	// here, "g1" is 100 kb and ranges from position 0 to 99999
	initializeGenomicElement(g1, 0, 99999);

	// set uniform recombination rate along the region
	// can be ignored: the Y doesnt do recombination in slim
	initializeRecombinationRate(0);

	// initialize chromosome type
	initializeSex("Y");
}

// now create 1 population of 500 individuals
// this runs at generation 1; the very beginning of the simulation
// note that slim simulates diploids: therefore, 1000 individuals are needed for a population of 500 Y chromosomes
// finally, output the data from all 500 males in MS format after 10000 generations
1 { sim.addSubpop("p1", 1000); }
10000 late() { p1.outputMSSample(500,requestedSex="M"); }
```

The script above is [here](https://github.com/houghjosh/XYdiversity/blob/master/sims/Y_neutral.txt), and can be run with the command: `slim Y_neutral.txt` (assuming slim is in your path)

##### Check that Y/A neutral diversity is 1/4 after 4Ne generations in a mutation-drift model

As a quick check that this behaves the way we want, let's use the same neutral simulation parameters above and simulate autosomal chromosomes (using the `initializeSex("A");` callback), setting a non-zero recombination rate, and then calculate the Y/A ratio of neutral diversity after _4Ne_ generations; the mean time to fixation for a neutral mutation. We expect that the Y/A diversity ratio should be 0.25. In this [script](https://github.com/houghjosh/XYdiversity/blob/master/sims/A_neutral.txt), recombination is set to occur uniformly at a rate of 10-8 per bp per generation (corresponding to 1 cM/Mbp).

Since polymorphism data is outputted in MS format, we can calculate diversity statistics directly from the output, by way of a pipe to [msstats](https://github.com/molpopgen/msstats):

`slim Y_neutral.txt | msstats `

`slim A_neutral.txt | msstats `

Such tests show that average Y/A diversity after _4Ne_ generations is approx. 0.25, as expected. Let's look at the mean pi across 500 replicate simulations for Y and autosomes.

```Shell
for i in $(seq 1 500); do slim -d L=100000 A_neutral.txt | msstats | awk '{print $5}' | sed '1d;2d'; done | awk -v N=0 '{ sum += $N } END { if (NR > 0) print sum / NR }'
```

`39.3508`

This is pretty close to our expectation for theta: `4*1000*10^-7*100000`

```Shell
for i in $(seq 1 500); do slim -d L=100000 Y_neutral.txt | msstats | awk '{print $5}' | sed '1d;2d'; done | awk -v N=0 '{ sum += $N } END { if (NR > 0) print sum / NR }'
```

`10.3366`

This is also about what we expect for theta: `4*500*10^-7*100000` (note that the relevant _N_ for the Y chromosome is the N of males. 500 in this case)

and the netrual Y/A ratio: 10.3366/39.3508

`= 0.262678268`, which is approximately 1/4 as expected. (can verify that this converges to 0.25 by increasing the n's and reps. I've just done 500 reps here for 500 Y chromosomes)

### 2. Adding deleterious mutations

Our goal is to simulate selection against deleterious mutations on the Y chromosome to understand the extent to which associations among selected sites affect levels of neutral polymorphism. Because selective interference among mutations should depend on **the number of selected loci**, _L_, here we explore a range of values of _L_ and determine the relation between the number of selected loci and the reduction in linked neutral diversity.

We use a gamma distribution to model deleterious mutations at functional sites. This DFE type is defined by two parameters, a shape parameter and a mean value. Here we use empirically-estimated values for the shape and mean of the DFE obtained from the X-chromosome in _R. hastatulus_.  

By setting `initializeGenomicElement(g1, 0, L);`, we can then specify _L_ on the command line using `slim -d`, and then iteratively run the simulations across a range of inputs for _L_.

First, let's do 1000 simulations using our empirically-estimated (from cytological data) number of sites likely to be experiencing selection on the Y (13 million) and calculate pi

```Shell
for i in $(seq 1 1000); do slim -d L=1300000 Y_deleterious.txt | msstats | awk '{print $5}' | sed '1d;2d'; done | awk -v N=0 '{ sum += $N } END { if (NR > 0) print sum / NR }'
```

expect: `4*500*10^-7*1300000 = 260`

observed: `23.2274`

reduction: `0.088 = 8.8%`


OK, so do it across a range of _L_, in increments of 100000kb, with 500 replicate sims at each _L_ and estimate pi

```Shell
for L in $(seq 100000 100000 1500000 | awk -F',' '{printf "%.f\n", $1}'); do for i in $(seq 1 1000); do slim -d L=${L} Y_deleterious.txt | msstats | awk '{print $5}' | sed '1d;2d'; done | awk -v N=0 '{ sum += $N } END { if (NR > 0) print sum / NR }'; done; > pi_1000_reps.txt
```

This gives you a list of 15 pi values. These represent the means of the 500 simulated pi's for each increment of _L_

Let's gather the pi's and values for L together and compare to expected pi's

```Shell
for L in $(seq 100000 100000 1500000 | awk -F',' '{printf "%.f\n", $1}'); do awk "BEGIN {print 4*500*1e-8*${L}}"; done > exp_pi.txt

seq 100000 100000 1500000 | awk -F',' '{printf "%.f\n", $1}' > L.txt

paste L.txt pi.txt exp_pi.txt > data.txt
```

Now plot and fit a function


### 3. Estimating model parameters with ABC

install.packages("EasyABC")
library(EasyABC)

