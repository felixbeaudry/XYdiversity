vm <- c(0:100)
for (val in vm) {
  Nf=100000 #numner of females
  Nm=100000 #number of males
  N=Nf+Nf
  vf=0 #variance in female rep success
  kf=2 #mean number of offspring of females
  km=2 #mean number of offspring of males
  Nef=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of female reproductive variance on female Ne
  Nem=((Nm*(km-1))/((km-1)+(vm/km))) #effect of male reproductive variance on male Ne
  Ne=Nem+Nef
  Ne_06=4*Ne*(1-0.6)*0.6
  Ne_07=4*Ne*(1-0.7)*0.7
  Ne_08=4*Ne*(1-0.8)*0.8
  Ne_09=4*Ne*(1-0.9)*0.9
  Ne_ratio=Nef/Nem
  A=(4*Nef*Nem)/(Nef+Nem) #autosome Ne 
  X=(9*Nef*Nem)/(((2*Nef))+4*Nem) #X-chromosome Ne
  Y=Nem/2
  XA=X/A
  YA=Y/A
}
d <- data.frame(vm,Nem,Nef,Ne_ratio,A,X,Y,XA,YA, Ne, Ne_06,Ne_07,Ne_08,Ne_09)

plot(vm,(Nem/2)/N, type="l", xlim = c(0,100))
plot(vm,(Ne)/N, type="l", xlim = c(0,20))
plot(vm,YA,type="l", xlim = c(0,100))
plot(vm,XA,type="l", xlim = c(0,100))


require(ggplot2)
ggplot(d, aes(vm)) +                   
  geom_line(aes(y=(Ne/4)/N), colour="red") +
  geom_line(aes(y=(Ne_06/4)/N), colour="blue") +
  geom_line(aes(y=(Ne_07/4)/N), colour="green") +
  geom_line(aes(y=(Ne_08/4)/N), colour="red") +
  geom_line(aes(y=(Ne_09/4)/N), colour="brown")
  
Nf=100000 #numner of females
Nm=100000 #number of males
N=Nf+Nf
ne_A_poisson=(4*N*(1-r)*r)/N
ne_X_poisson=(9*N*r*(r-1)/(2*(r-2)))/N
  
ne_A_0.6=(4*N*(1-0.6)*0.6)/N
ne_X_0.6=(9*N*r*(r-1)/(2*(r-2)))/N
    
    
    Nef_0.6=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of female reproductive variance on female Ne
    Nem_0.6=((Nm*(km-1))/((km-1)+(vm/km))) #effect of male reproductive variance on male Ne
    Ne=Nem+Nef
    test<- data.frame(ne_A,ne_X,Nef,Nem,Ne)



r <- seq(0,1,0.01)
for (ratio in r) {
  Nf=100000 #numner of females
  Nm=100000 #number of males
  N=Nf+Nf
  ne_A_2=
    ne_A_poisson=4*N*(1-r)*r
  ne_A_2=4*N_2*(1-r)*r
  
}


################################################################################################
################################################################################################
Nf=100000 #number of females
Nm=100000 #number of males
N=Nf+Nm #total number of individuals
#x=Nf/(Nf+Nm) #proportion of females

Expected Ne as a function of the sex ratio for different chromosome types in a neutral model
curve((4*N*(1-x)*x), from=0,to=1, #autosomes
      ylab="Effective population size (Ne)", 
      xlab= "Nf/(Nf+Nm)") 
      #,ylim=c(0,Nf+Nm)/N)

vf=2 #variance in female rep success
kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males
N_2=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(2/km))) #effect of male reproductive variance on male Ne
curve((4*N_2*(1-x)*x), from=0,to=1,add=T)

N_3=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(3/km))) #effect of male reproductive variance on male Ne
curve((4*N_3*(1-x)*x), from=0,to=1,add=T)

N_4=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(4/km))) #effect of male reproductive variance on male Ne
curve((4*N_4*(1-x)*x), from=0,to=1,add=T)

N_5=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(5/km))) #effect of male reproductive variance on male Ne
curve((4*N_5*(1-x)*x), from=0,to=1,add=T)

N_05=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(0.5/km))) #effect of male reproductive variance on male Ne
curve((4*N_05*(1-x)*x), from=0,to=1,add=T)

N_0=((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(0/km))) #effect of male reproductive variance on male Ne
curve((4*N_0*(1-x)*x), from=0,to=1,add=T)

curve((4*N_2*(1-x)*x)/N, from=0,to=1, #autosomes
      ylab="Effective population size (Ne)", 
      xlab= "Nf/(Nf+Nm)", 
      ylim=c(0,Nf+Nm)/N)

curve((9*N*x*(x-1)/(2*(x-2))),from=0,to=1, col="red",add=T) #Xchromosomes
curve(N*(1-x)/(2)/N,from=0,to=1, add=T) #Ychromosomes
curve(N_5*(1-x)/(2)/N,from=0,to=1, add=T) #Ychromosomes



lines(YA)
text(0.5,2800, labels="Y")
text(0.5,7800, labels="X")
text(0.5,10300, labels="A")
abline(v=0.6,lty=2)

#Nucelotide diversity ratios (for a neutral model, assuming equal mutation rates, and theta=4Nemu)
curve(((9*N*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1,
      ylab=expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
      xlab="Nf/(Nf+Nm)",
      ylim=c(0,2))
curve(((9*N_0*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*N_2*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*N_3*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*N_4*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)
curve(((9*N_5*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1, add=T)

text(0.8,1.05, labels="X/A")
text(0.8,0.25, labels="Y/A")

curve(N*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(N_0*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(N_2*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(N_3*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(N_4*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes
curve(N_5*(1-x)/(2)/(4*N*(1-x)*x),from=0,to=1, add=T) #Ychromosomes

curve(N*(1-x)/(2)/N,from=0,to=1, add=T) #Ychromosomes


################################################################################################
################################################################################################
