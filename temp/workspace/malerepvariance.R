#the effect of male reproductive variance on sex chromosome to autosome ratios of Ne

#(4*Nf*Nm)/(Nf+Nm) #autosome Ne 
#(9*Nf*Nm)/(((2*Nf))+4*Nm) #X-chromosome Ne
#Nm/2 #Y chromosome Ne
#Nf=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of fmeale reproductive variance on female Ne: 
#Nm=((Nm*(km-1))/((km-1)+(vm/km))) #effect of male reproductive variance on male Ne

#set numbers of males and females
#Nft=100000 #Nf for Ntheoretical population of autosomes, equal males and females, no rep variance, poisson offspring
#Nmt=100000 #Nm for theoretical population of autosomes, equal males and females, no rep variance, poisson offspring
vf=2 #variance in female rep success. Set to zero. (change to 2 for poisson)
kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males
Nf=100000 #female Ne
Nm=100000 #male Ne


#effect of male rep variance on autosomal Ne
#(4*Nf*Nm)/(4*Nf+Nm) #autosome Ne
#((4*Nf*Nm)/((4*Nf)+Nm))/((4*Nf*Nm)/((4*Nf)+Nm)) #autosomes relative to autosomes 
#replace numerator Ne's with rep variance equations for males and females
#((4*Nf*Nm)/((4*Nf)+Nm))/((4*Nf*Nm)/((4*Nf)+Nm))

#Nf=((Nf*(kf-1))/((kf-1)+(vf/kf))) #effect of fmeale reproductive variance on female Ne: 
#Nm=((Nm*(km-1))/((km-1)+(x/km))) #effect of male reproductive variance on male Ne

curve(((4*((Nf*(kf-1))/((kf-1)+(vf/kf)))*((Nm*(km-1))/((km-1)+(x/km))))/((4*((Nf*(kf-1))/((kf-1)+(vf/kf))))+((Nm*(km-1))/((km-1)+(x/km)))))/((4*Nft*Nmt)/((4*Nft)+Nmt)),
      from=0,to=100,  col="black", lwd=2, 
      xlab="male reproductive variance",
      ylab="relative Ne", ylim=c(0,1))
#XA
#(9*Nf*Nm)/(((2*Nf))+4*Nm) #X-chromosome Ne
#((9*((Nf*kf-1)/(kf-1+(vf/kf)))*((Nm*km-1)/(km-1+(2/km))))/((2*((Nf*kf-1)/(kf-1+(vf/kf))))+(4*((Nm*km-1)/(km-1+(2/km))))))/((4*Nft*Nmt)/(Nft+Nmt))
#note that when x=2, the above equation= 1.125, the theoretical upper limit. 
curve(((9*((Nf*kf-1)/(kf-1+(vf/kf)))*((Nm*km-1)/(km-1+(x/km))))/((2*((Nf*kf-1)/(kf-1+(vf/kf))))+(4*((Nm*km-1)/(km-1+(x/km))))))/((4*Nft*Nmt)/(Nft+Nmt)),
      from=0,to=100,  col="blue", lwd=2, ylim=c(0,1),ylab="relative Ne",xlab="variance in male fitness")
#YA
#(((Nm*km-1)/(km-1+(2/km)))/2)/((4*Nft*Nmt)/(Nft+Nmt))
#note that when x=2, the above equation= 0.25, as expected 
curve((((Nm*km-1)/(km-1+(x/km)))/2)/((4*Nft*Nmt)/(Nft+Nmt)),from=0,to=100, col="red",add=T)

legend("topright", c("autosomes","X/A","Y/A"),col=c("black","blue","red"),
       cex=0.7, box.lty=0,lty=c(1), lwd=2)

abline(h=tx_x_auto,lty=2)
abline(h=tx_y_auto,lty=2)
abline(v=40,lty=2)
text(20,0.89, "estimated X/A", cex=0.75)
text(20,0.007, "estimated Y/A", cex=0.75)sex
points(40,0.2, pch=19, cex=2)



#curve(((4*(Nf*kf-1)/(kf-1+(vf/kf))*(Nm*km-1)/(km-1+(x/km)))/((Nf*kf-1)/(kf-1+(vf/kf))+(Nm*km-1)/(km-1+(x/km))))/((4*Nft*Nmt)/(Nft+Nmt)),
#      from=0,to=100,  col="black", lwd=2, 
#      xlab="male reproductive variance",
#      ylab="relative Ne")

#Xchromosome
#(9*Nef*Nem)/((2*Nef)+4*Nem)
#curve(((9*(Nf*kf-1)/(kf-1+(vf/kf))*(Nm*km-1)/(km-1+(x/km)))/((2*(Nf*kf-1)/(kf-1+(vf/kf)))+4*(Nm*km-1)/(km-1+(x/km))))/((4*Nft*Nmt)/(Nft+Nmt)),
#      from=0,to=100, add=T, col="darkblue", lwd=2)

#Ychromosome
#curve((((Nm*km-1)/(km-1+(x/km)))/2)/((4*Nft*Nmt)/(Nft+Nmt)),
#      from=0,to=100, add=T,col="darkgreen", lwd=2)


# Generating a random sample from a Poisson distribution with lambda=3
#set.seed(124)
#pois <- rpois(100000, lambda = 5)
#hist(pois[1:10000], breaks=100)
#mean(pois)
#var(pois)


#variance in reproductive success effects Ne
#k=mean
#x=variance

#k=2
#Nf=1000
#Nm=1000
#curve((Nf*k-1)/(k-1+(x/k)), 
#      from=0,to=100,
#      xlab="variance in reproductive success",
#      ylab="Ne")
#curve((Nm*k-1)/(k-1+(x/k)),from=0,to=100, add=T)
