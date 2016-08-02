Nf=100 #number of females
Nm=100 #number of males
N=Nf+Nm #total number of individuals
x=Nm/(Nf+Nm) #proportion of males

op <- par(mfrow = c(1, 2))
m=0
f=0

curve(((4*N*(1-x)*x*N)/((x*N*(1+f))+((1-x)*N*(1+m))))/N, from=0, to=1, lty=2,
      xlab=expression(italic('N'[m]/'N'[m]+'N'[f])),
      ylab=expression(italic('N'[e]/N)), 
      main="Autosomes", ylim=c(0,1), xlim=c(0,1))

mh=0.5
curve(((4*N*(1-x)*x*N)/((x*N*(1+f))+((1-x)*N*(1+mh))))/N, from=0, to=1, add=T)

m1=1
curve(((4*N*(1-x)*x*N)/((x*N*(1+f))+((1-x)*N*(1+m1))))/N, from=0, to=1, add=T)

m2=2
curve(((4*N*(1-x)*x*N)/((x*N*(1+f))+((1-x)*N*(1+m2))))/N, from=0, to=1, add=T)

m3=3
curve(((4*N*(1-x)*x*N)/((x*N*(1+f))+((1-x)*N*(1+m3))))/N, from=0, to=1, add=T)

#for sex-linked genes
curve(((9*N*(x)*N*(1-x))/((4*N*x*(1+f))+(2*N*(1-x)*(1+m))))/N, from=0, to=1, lty=2,
      xlab=expression(italic('N'[m]/'N'[m]+'N'[f])), 
      ylab=expression(italic('N'[e]/N)), 
      main="Sex chromosomes", ylim=c(0,1),xlim=c(0,1))

curve(((9*N*(x)*N*(1-x))/((4*N*x*(1+f))+(2*N*(1-x)*(1+mh))))/N, from=0, to=1, add=T)

curve(((9*N*(x)*N*(1-x))/((4*N*x*(1+f))+(2*N*(1-x)*(1+m1))))/N, from=0, to=1, add=T)

curve(((9*N*(x)*N*(1-x))/((4*N*x*(1+f))+(2*N*(1-x)*(1+m2))))/N, from=0, to=1, add=T)

curve(((9*N*(x)*N*(1-x))/((4*N*x*(1+f))+(2*N*(1-x)*(1+m3))))/N, from=0, to=1, add=T)

curve((((N*(x)*(1+f))/2))/N, from=0, to=1, col="red", add=T)



par(op)
