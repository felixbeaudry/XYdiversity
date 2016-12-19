barplot(as.matrix(ChrRatios), beside=TRUE, col=c("darkgreen", "black", "gray22","gray73","gray87","gray93","darkgreen","black", "gray22","gray73","gray87", "gray93"),
        ylab = expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
        ylim=c(0,1.2))
legend("topright", c("observed", "Nf/(Nf+Nm) = 0.5", "Nf/(Nf+Nm) = 0.6", "Nf/(Nf+Nm) = 0.7", "Nf/(Nf+Nm) = 0.8", "Nf/(Nf+Nm) = 0.9"), fill=c("darkgreen", "black", "gray22","gray73","gray87", "gray93"), box.lty=0, cex=0.7)

# empirical XA confidence intervals
segments(x0=1.5,y0=0.7,x1=1.5,y1=0.9,lwd=0.75)
arrows(x0=1.5,y0=0.7,x1=1.5,y1=0.9,lwd=0.75,angle = 90, code = 3, length = 0.04)

# simulated XA confidence intervals
#segments(x0=2.5,y0=0.7,x1=2.5,y1=0.8,lwd=0.75)
#arrows(x0=2.5,y0=0.7,x1=2.5,y1=0.8,lwd=0.75,angle = 90, code = 3, length = 0.04)

# empirical YA confidence intervals
segments(x0=8.5,y0=0.01,x1=8.5,y1=0.04,lwd=0.75)
arrows(x0=8.5,y0=0.01,x1=8.5,y1=0.04,lwd=0.75,angle = 90, code = 3, length = 0.04)


188266

empirical_sfs=c(187850/188266, 222/188266, 73/188266, 32/188266, 20/188266, 45/188266, 24/188266, 0, 0, 0, 0, 0, 0)
sfs=c(0.0756799, 0.0115273, 0.00639306, 0.00517519, 0.00541744)
options(scipen=0)
barplot(sfs, ylim=c(0,0.1), ylab="Relative SFS (Qn(i))", xlab="Derived allele frequency", main="coarse grained predictions")

barplot(empirical_sfs, ylim=c(0,0.1))

Original parameters: 127.67 1374 0
Coarse-grained parameters: 171.123752462 1025.09778728 0
Calculating time spectrum for parameters Ns=171.124, NU=1025.1, n=6
Qn(i): [ 1.          0.12343715  0.05657223  0.04769479  0.05992975]

plot(log(0.12343715/1), log(0.05657223/0.12343715), log(0.04769479/0.05657223), log(0.05992975/0.04769479))
plot(-2.09202, -0.780214, -0.170696, 0.228351)


barplot(c(tx_y_auto,ya_given_x,bgs_exp), ylim=c(0,0.04), col="gray52", ylab="Y/A",
        names.arg=c("observed", "predicted from X", "predicted by bgs"), cex.names=0.75)
segments(x0=0.7,y0=0.01,x1=0.7,y1=0.04,lwd=0.75)
arrows(x0=0.7,y0=0.01,x1=0.7,y1=0.04,lwd=0.75,angle = 90, code = 3, length = 0.04)