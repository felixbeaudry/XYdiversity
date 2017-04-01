## Simulating Hill-Robertson Interference during Y-chromosome evolution


### 1. Neutral simulations
We’ll start with a basic neutral simulation that models a genomic region of length **100 kb** in a population of **1000 diploid individuals** (500 Y chromosomes), evolving over **10,000 generations**. Neutral mutations occur uniformly on the Y at a rate of **10-7 per bp per generation**.

Note that when modeling the Y chromosome, individuals can only possess zero or one copy of a given mutation, since males possess one Y and females possess none. For this reason, SLiM does not use a dominance coefficient at all in this case. The selection coefficient of the mutation determines its fitness effect, and the dominance coefficient supplied in the mutation type is ignored. Also, since we are interested in modeling Y chromosomes (which we specify using the `initializeSex("Y");` callback), the X chromosome is handled by SLiM as a “null chromosome”; it exists essentially only for diploid book-keeping. (see `SLiM_Manual.pdf`).


```R
// set up a simple neutral simulation
initialize()
{
	// set the overall mutation rate per base position per generation
	initializeMutationRate(1e-7);

	// "m1" mutation type: m1=neutral; 0.5=dominance (ignored), f=fixed dfe, 0=s
	initializeMutationType("m1", 0.5, "f", 0.0);

	// "g1" genomic element type: m1 for all mutations. This creates a new genomic element type named "g1". A genomic element type represents a particular type of chromosomal region – introns, exons, UTRs, etc. Here, the genomic element type "g1" is defined as using mutation type m1 for all of its mutations (as specified by the proportion 1.0, supplied as the third parameter).
	initializeGenomicElementType("g1", m1, 1.0);

	// initialize a uniform chromosome of length 100 kb: This callback uses "g1" to set up the genomic element. Here, "g1" is 100 kb in length, ranging from position 0 to 99999.
	initializeGenomicElement(g1, 0, 99999);

	// uniform recombination along the chromosome
	initializeRecombinationRate(0);

	// definine Y chromosomes
	initializeSex("Y");
}

// now create 1 population of 500 individuals
// this is scheduled to run at generation 1; the very beginning of the simulation
// note that slim simulates diploids: therefore, 1000 individuals are needed for a population of 500 Y chromosomes
//finally, output the data from all 500 males in MS format
1 { sim.addSubpop("p1", 1000); }
10000 late() { p1.outputMSSample(500,requestedSex="M"); }

```

The script above is here(link), and can be run with the command: `slim Yneutral.txt`

##### Check that Y/A neutral diversity is 1/4 after 4Ne generations

- As a check, do the same simulation above on autosomal chromosomes, using the `initializeSex("A");` callback, and initializing a non-zero recombination rate, and then calculate the Y/A ratio of diversity after reaching equilibrium (_4Ne_ generations; the mean time to fixation for a neutral mutation).

- Here, recombination was set to occur uniformly at a rate of 10-8 per bp per generation (corresponding to 1 cM/Mbp).

- Since data is outputted in MS format, you can calculate diversity statistics directly from the output, by way of a pipe to msstats:

`slim Y_neutral.txt | msstats `
`slim A_neutral.txt | msstats `

Some quick tests show that Y/A in a neutral simulation, after 4Ne generations is approximately 0.25. Let's look at the distribution for 1000 replicate sims. I've found it simper to just replicate the script 1000 times and run them in a for loop. This comes in handy later when considering a range of selected sites or selection coefficients.

```Shell
for run in {1..1000}; do slim Y_neutral.txt | msstats | awk '{print $4}'; done

```

- plot data


### 2. Adding deleterious mutations

Our goal here is to simulate selection against deleterious mutations on the Y chromosome to understand the extent to which genetic associations among selected sites can affect levels of neutral polymorphism. Because selective interference among mutations depends on **the number of selected loci**, we initialize the simulation with our independently-estimated number of sites under selection in _Rumex_. This _L_ parameter is then varied to consider the relation between the number of selected loci and the reduction in linked neutral diversity.

A gamma distribution is used to model deleterious mutations at functional sites. This DFE type is defined by two parameters, a shape parameter and a mean value. We use empirically-estimated values for the shape and mean of the DFE obtained from the X-chromosome.  


```R
// set up a simple neutral simulation
initialize()
{
	// set the overall mutation rate per base position per generation
	initializeMutationRate(1e-7);
```

S cannot be described simply as a reduction in the efficacy of selection and effective population size in standard models of selection and drift. Rather, IS can be better understood with models that incorporate a constant “traffic” of competing alleles

### 3. Adding beneficial mutations

To evaluate the alternative possibility that selective sweeps of beneficial mutations is primarily responsible for the reduction in diversity that we observed, we run the same simulation above with the addition of beneficial mutations and determine whether this improves the fit of our data









