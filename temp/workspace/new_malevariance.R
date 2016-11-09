#set numbers of males and females
#vm=50 #variance in male rep success
vf=2 #variance in female rep success
kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males
Nf=100000 #numner of females
Nm=100000 #number of males

Nef=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of female reproductive variance on female Ne
Nem=((Nm*(km-1))/((km-1)+(vm/km))) #effect of male reproductive variance on male Ne

Ne_ratio=Nef/Nem
N=Nf+Nf

A=(4*Nef*Nem)/(Nef+Nem) #autosome Ne 
X=(9*Nef*Nem)/(((2*Nef))+4*Nem) #X-chromosome Ne
Y=Nem/2
XA=X/A
YA=Y/A

vm <- c(1:100000)
for (val in vm) {
}
plot(((Nm*(km-1))/((km-1)+(vm/km)))/Nef, ylab="Nem/Nef",xlab="vm", type="l")


vm <- c(1:50)
for (val in vm) {
Nf=100000 #numner of females
Nm=100000 #number of males
N=Nf+Nf
vf=2 #variance in female rep success
kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males
Nef=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of female reproductive variance on female Ne
Nem=((Nm*(km-1))/((km-1)+(vm/km))) #effect of male reproductive variance on male Ne
Ne_ratio=Nef/Nem
A=(4*Nef*Nem)/(Nef+Nem) #autosome Ne 
X=(9*Nef*Nem)/(((2*Nef))+4*Nem) #X-chromosome Ne
Y=Nem/2
XA=X/A
YA=Y/A
}
#plot(YA, ylab="Y/A",xlab="vm", type="l")
#plot(XA, add=TRUE)
d <- data.frame(vm,Nem,Nef,Ne_ratio,A,X,Y,XA,YA)
require(ggplot2)
ggplot(d, aes(vm)) +                    # basic graphical object
  geom_line(aes(y=YA), colour="red") +  # first layer
  geom_line(aes(y=XA), colour="green")  # second layer
g <- g + ylab("Y") + xlab("X")
g



################################################################################################
################################################################################################
Nf=5000 #number of females
Nm=5000 #number of males
N=Nf+Nm #total number of individuals
x=Nf/(Nf+Nm) #proportion of females

#Expected Ne as a function of the sex ratio for different chromosome types in a neutral model
curve(4*N*(1-x)*x, from=0,to=1, #autosomes
      ylab="Effective population size (Ne)", 
      xlab= "Nf/(Nf+Nm)", 
      ylim=c(0,Nf+Nm/N))
curve(9*N*x*(x-1)/(2*(x-2)),from=0,to=1, add=T) #Xchromosomes
curve(N*(1-x)/2,from=0,to=1, add=T) #Ychromosomes
text(0.5,2800, labels="Y")
text(0.5,7800, labels="X")
text(0.5,10300, labels="A")
abline(v=0.6,lty=2)

#Nucelotide diversity ratios (for a neutral model, assuming equal mutation rates, and theta=4Nemu)
curve(((9*N*x*(x-1)/(2*(x-2))))/(4*N*(1-x)*x), from=0, to=1,
      ylab=expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
      xlab="Nf/(Nf+Nm)",
      ylim=c(0,2))
curve((N*(1-x)/2)/(4*N*(1-x)*x), from=0, to=1,add=T)
text(0.8,1.05, labels="X/A")
text(0.8,0.25, labels="Y/A")

################################################################################################
################################################################################################



#X/A
curve((((9*((Nf*(kf-1))/((kf-1)+(vf/kf)))*((Nm*(km-1))/((km-1)+(x/km))))/(((2*((Nf*(kf-1))/((kf-1)+(vf/kf)))))+4*((Nm*(km-1))/((km-1)+(x/km)))))/((4*((Nf*(kf-1))/((kf-1)+(vf/kf)))*((Nm*(km-1))/((km-1)+(x/km))))/(((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(x/km)))))), 
      from=2, to=100, ylim=c(0,1.125),
      col="blue", lwd=2, 
      xlab="male reproductive variance",
      ylab="relative Ne")

#Y/A
curve((((Nm*(km-1))/((km-1)+(x/km)))/2)/((4*((Nf*(kf-1))/((kf-1)+(vf/kf)))*((Nm*(km-1))/((km-1)+(x/km))))/(((Nf*(kf-1))/((kf-1)+(vf/kf)))+((Nm*(km-1))/((km-1)+(x/km))))), 
      from=2, to=100, ylim=c(0,1.125),
      col="red", lwd=2)


legend("right", c("X/A","Y/A"),col=c("blue","red"),
       cex=0.7, box.lty=0,lty=c(1), lwd=2)

abline(h=0.85,lty=1,lwd=2)
abline(h=0.02,lty=1, lwd=2)
abline(h=0.188,lty=1, lwd=2)

#abline(h=0.07,lty=2)
#abline(h=0.0001,lty=2)

segments(x0=6.3, y0=-1, x1=6.3, y1=0.85,lty=2)
text(50,0.87, "observed X/A = 0.87", cex=0.75)
text(50,0.2, "model predicted Y/A = 0.19", cex=0.75)
text(50,0.04, "observed Y/A = 0.02", cex=0.75)
points(6.3,0.188, pch=19, cex=1)


