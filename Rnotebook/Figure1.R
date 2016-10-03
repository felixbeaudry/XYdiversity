Nf=100 #number of females
Nm=100 #number of males
N=Nf+Nm #total number of individuals
#x=Nf/(Nf+Nm) #proportion of males

op <- par(mfrow = c(1, 3))
m=0
f=0

curve(((4*N*(1-x)*x*N)/(((1-x)*N*(1+f))+(x*N*(1+m))))/N, from=0, to=1, lty=2,
      xlab=expression(italic('N'[f]/'N'[m]+'N'[f])),
      ylab=expression(italic('N'[e]/N)), 
      main="Autosomes", ylim=c(0,1), xlim=c(0,1))

mh=0.5
curve(((4*N*(1-x)*x*N)/(((1-x)*N*(1+f))+(x*N*(1+mh))))/N, from=0, to=1, add=T)

m1=1
curve(((4*N*(1-x)*x*N)/(((1-x)*N*(1+f))+(x*N*(1+m1))))/N, from=0, to=1, add=T, col="blue")

m2=2
curve(((4*N*(1-x)*x*N)/(((1-x)*N*(1+f))+(x*N*(1+m2))))/N, from=0, to=1, add=T)

m3=3
curve(((4*N*(1-x)*x*N)/(((1-x)*N*(1+f))+(x*N*(1+m3))))/N, from=0, to=1, add=T)

#for sex-linked genes
curve(((9*N*(1-x)*N*(x))/((4*N*(1-x)*(1+f))+(2*N*(x)*(1+m))))/N, from=0, to=1, lty=2,
      xlab=expression(italic('N'[f]/'N'[f]+'N'[m])), 
      ylab=expression(italic('N'[e]/N)), 
      main="X chromosomes", ylim=c(0,1),xlim=c(0,1))

curve(((9*N*(1-x)*N*(x))/((4*N*(1-x)*(1+f))+(2*N*(x)*(1+mh))))/N, from=0, to=1, add=T)

curve(((9*N*(1-x)*N*(x))/((4*N*(1-x)*(1+f))+(2*N*(x)*(1+m1))))/N, from=0, to=1, add=T, col="blue")

curve(((9*N*(1-x)*N*(x))/((4*N*(1-x)*(1+f))+(2*N*(x)*(1+m2))))/N, from=0, to=1, add=T)

curve(((9*N*(1-x)*N*(x))/((4*N*(1-x)*(1+f))+(2*N*(x)*(1+m3))))/N, from=0, to=1, add=T)

#curve((((N*(1-x)*(1+f))/2))/N, from=0, to=1, col="blue", add=T)


vf=2 #variance in female rep success
kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males

Ne_05=((Nm*(km-1))/((km-1)+(0.5/km)))+Nf
Ne_0=((Nm*(km-1))/((km-1)+(0/km)))+Nf #no variation in male mating success; value here is the same as Nm+Nf 
Ne_2=((Nm*(km-1))/((km-1)+(2/km)))+Nf #poission
Ne_3=((Nm*(km-1))/((km-1)+(3/km)))+Nf 
Ne_4=((Nm*(km-1))/((km-1)+(4/km)))+Nf
Ne_5=((Nm*(km-1))/((km-1)+(5/km)))+Nf

#Nucelotide diversity ratios (for a neutral model, assuming equal mutation rates, and theta=4Nemu)
curve(((9*N*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1,lty=2,
      main="X/A and Y/A",
      ylab=expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
      xlab=expression(italic('N'[f]/'N'[m]+'N'[f])),
      ylim=c(0,2))
#curve(((9*Ne_0*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*Ne_2*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T, col="blue")
curve(((9*Ne_05*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*Ne_3*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*Ne_4*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
#curve(((9*Ne_5*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)

text(0.8,1.05, labels="X/A")
text(0.8,0.25, labels="Y/A")

#curve(N*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(Ne_0*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T, lty=2) #Ychromosomes
curve(Ne_2*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T, col="blue") #Ychromosomes
curve(Ne_3*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(Ne_4*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
#curve(Ne_5*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(Ne_05*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes

#curve((((Ne_05*(1-x)*(1+f))/2))/N, from=0, to=1, col="red", add=T)
#curve((((Ne_0*(1-x)*(1+f))/2))/N, from=0, to=1, col="red", add=T, lty=2)
#curve((((Ne_2*(1-x)*(1+f))/2))/N, from=0, to=1, col="blue", add=T)
#curve((((Ne_3*(1-x)*(1+f))/2))/N, from=0, to=1, col="red", add=T)
#curve((((Ne_4*(1-x)*(1+f))/2))/N, from=0, to=1, col="red", add=T)
#curve((((Ne_5*(1-x)*(1+f))/2))/N, from=0, to=1, col="red", add=T)

Ne_500=((Nm*(km-1))/((km-1)+(500/km)))+Nf
curve(Ne_500*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T, col="red") #Ychromosomes


#Nucelotide diversity ratios (for a neutral model, assuming equal mutation rates, and theta=4Nemu)
#curve(((9*N*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1,
#      ylab=expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
#      xlab="Nf/(Nf+Nm)",
#      ylim=c(0,2))
#curve((N*(1-x)/2)/(4*N*(1-x)*x), from=0, to=1,add=T)
#text(0.8,1.05, labels="X/A")
#text(0.8,0.25, labels="Y/A")