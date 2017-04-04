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

##### Check that Y/A neutral diversity is 1/4 after 4Ne generations

As a quick check that this behaves the way we want, let's use the same neutral simulation parameters above and simulate autosomal chromosomes (using the `initializeSex("A");` callback), setting a non-zero recombination rate, and then calculate the Y/A ratio of neutral diversity after _4Ne_ generations; the mean time to fixation for a neutral mutation. We expect that the Y/A diversity ratio should be 0.25. In this [script](https://github.com/houghjosh/XYdiversity/blob/master/sims/A_neutral.txt), recombination was set to occur uniformly at a rate of 10-8 per bp per generation (corresponding to 1 cM/Mbp).

Since polymorphism data is outputted in MS format, we can calculate diversity statistics directly from the output, by way of a pipe to [msstats](https://github.com/molpopgen/msstats):

`slim Y_neutral.txt | msstats `

`slim A_neutral.txt | msstats `

Such tests show that average Y/A diversity after _4Ne_ generations is approximately 0.25, as expected. Let's look at the distribution of [Wattersons's theta](https://www.ncbi.nlm.nih.gov/pubmed/1145509) for 500 replicate sims.

```Shell
for i in {1..500}; do slim Y_neutral.txt | msstats | awk '{print $ 4}' | sed '1d;2d'; done > neutral_Y_thetas

for i in {1..500}; do slim A_neutral.txt | msstats | awk '{print $ 4}' | sed '1d;2d'; done > neutral_A_thetas

```

- plot

### 2. Adding deleterious mutations

Our goal is to simulate selection against deleterious mutations on the Y chromosome to understand the extent to which genetic associations among selected sites can affect levels of neutral polymorphism. Because selective interference among mutations depends on **the number of selected loci**, _L_, we initialize the simulation with our independently-estimated number of sites under selection in _Rumex_. This _L_ parameter is then varied to consider the relation between the number of selected loci and the reduction in linked neutral diversity.

We use a gamma distribution to model deleterious mutations at functional sites. This DFE type is defined by two parameters, a shape parameter and a mean value. Here we use empirically-estimated values for the shape and mean of the DFE obtained from the X-chromosome.  


```R
// simulation of Y chromosome evolution with deleterious mutations
initialize()
{
	// set the overall mutation rate per base position per generation
	initializeMutationRate(1e-7);

	// define mutation types
	// "m1"=neutral, 0.5=dominance (ignored), f=fixed dfe, 0=s
	initializeMutationType("m1", 0.5, "f", 0.0);

	// define genomic element type
	// This creates a new genomic element type. A genomic element type represents a particular type of chromosomal region – introns, exons, UTRs, etc. Here, "g1" is defined as using mutation type m1 for all of its mutations (as specified by the proportion 1.0, the third parameter)
	initializeGenomicElementType("g1", m1, 1.0);

	// initialize a uniform chromosome of length 100 kb
	// This callback uses "g1" to set up the genomic element
	// Here, "g1" is 100 kb and ranges from position 0 to 99999
	initializeGenomicElement(g1, 0, 99999);

	// set uniform recombination along the chromosome
	// can be ignored as the Y doesnt undergo recombination
	initializeRecombinationRate(0);

	// initialize chromosome type
	initializeSex("Y");
}

// now create 1 population of 500 individuals
// this call is scheduled to run at generation 1; the very beginning of the simulation
// note that slim simulates diploids: therefore, 1000 individuals are needed for a population of 500 Y chromosomes
// finally, output the data from all 500 males in MS format
1 { sim.addSubpop("p1", 1000); }
10000 late() { p1.outputMSSample(500,requestedSex="M"); }
```

S cannot be described simply as a reduction in the efficacy of selection and effective population size in standard models of selection and drift. Rather, IS can be better understood with models that incorporate a constant “traffic” of competing alleles

### 3. Adding beneficial mutations

To evaluate the alternative possibility that selective sweeps of beneficial mutations is primarily responsible for the reduction in diversity that we observed, we run the same simulation above with the addition of beneficial mutations and determine whether this improves the fit of our data









