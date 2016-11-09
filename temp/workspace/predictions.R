Nf=5000 #number of females
Nm=5000 #number of males
N=Nf+Nm #total number of individuals
x=Nf/(Nf+Nm) #proportion of females

#Expected Ne as a function of the sex ratio for different chromosome types in a neutral model
curve(4*N*(1-x)*x, from=0,to=1, #autosomes
      ylab="Effective population size (Ne)", 
      xlab= "Nf/(Nf+Nm)", 
      ylim=c(0,10000))
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
#abline(v=0.6,lty=2)
#points(0.6,tx_x_auto,pch=20,col="darkgreen") #empirical X/A weighted theta
#points(0.6,sc_x_auto,pch=20,col="darkred") #empirical X/A weighted theta
#points(0.6,fl_x_auto,pch=20,col="darkred") #empirical X/A weighted theta

#points(0.6,1.0,pch=15,col="darkgreen") # X/A mlhka
#points(0.6,0.017,pch=15,col="red") # Y/A mlhka
#points(0.6,tx_y_auto,pch=20, col="black") #empirical Y/A weighted theta
#points(0.6,sc_y_auto,pch=20, col="black") #empirical Y/A weighted theta
#points(0.6,fl_y_auto,pch=20, col="black") #empirical Y/A weighted theta

#segments(x0=0.6, y0=0.74, x1=0.6, y1=0.96, lwd=2, col="black") #conf interval for weighted mean X/A theta TX
#segments(x0=0.6, y0=0.001, x1=0.6, y1=0.07, lwd=2, col="black") #conf interval for weighted mean Y/A theta TX

#TX
#segments(x0=0.6,y0=lowerXA,x1=0.6,y1=upperXA,lwd=2, col="black")
#SC
#segments(x0=0.6,y0=lowerSC_XA,x1=0.6,y1=upperSC_XA,lwd=2, col="black")
#FL
#segments(x0=0.6,y0=lowerSC_XA,x1=0.6,y1=upperSC_XA,lwd=2, col="black")


#legend(x=0.2,y=2.0, c(expression(paste("X/A weighted mean ", theta, "  TX ")), 
                      #expression(paste("X/A weighted mean ", theta, "  SC & FL "))
                      #expression(paste("Y/A weighted mean ", theta, " "))),
       #pch=20,col=c("darkgreen","darkred","black"),pt.cex=1.2,
       #cex=0.7, box.lty=0)
#legend(x=0.2,y=2.0, c("X/A mlhka scalar", "Y/A mlhka scalar"),
        #pch=15,col=c("darkgreen","red"),pt.cex=1.2,
        #cex=0.7, box.lty=0)
#legend(x=0.2,y=1.6, c("mlhka credibility interval"),
        #cex=0.7, box.lty=0,lty=c(1),col="black", lwd=3)

#legend(x=0.2,y=1.4, c("likelihood credibility interval"),
       #cex=0.7, box.lty=0,lty=c(1),col="black", lwd=2)
#legend(x=0.2,y=1.6, c("bootstrapped confidence interval"),
       #cex=0.7, box.lty=0,lty=c(1),col="red", lwd=2)
