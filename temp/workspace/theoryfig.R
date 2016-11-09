Nf=5000 #number of females
Nm=5000 #number of males
N=Nf+Nm #total number of individuals
x=Nf/(Nf+Nm) #proportion of females

#Expected Ne as a function of the sex ratio for different chromosome types in a neutral model
par(mfrow=c(1,2))
curve(4*N*(1-x)*x, from=0,to=1, #autosomes
      ylab="Effective population size (Ne)", 
      xlab= "Nf/(Nf+Nm)", 
      ylim=c(0,11000), lwd=2)
curve(9*N*x*(x-1)/(2*(x-2)),from=0,to=1, lwd=2,add=T) #Xchromosomes
curve(N*(1-x)/2,from=0,to=1, lwd=2, add=T) #Ychromosomes
text(0.5,2800, labels="Y")
text(0.5,7800, labels="X")
text(0.5,10300, labels="A")
#abline(v=0.6,lty=2)

#Nucelotide diversity ratios (for a neutral model, assuming equal mutation rates, and theta=4Nemu)
curve(((9*N*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1,, lwd=2,
      ylab=expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
      xlab="Nf/(Nf+Nm)",
      ylim=c(0,2))
curve((N*(1-x)/2)/(4*N*(1-x)*x), lwd=2, from=0, to=1,add=T)
text(0.8,1.05, labels="X/A")
text(0.8,0.25, labels="Y/A")