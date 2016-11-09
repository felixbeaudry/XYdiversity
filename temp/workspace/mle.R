YAlikihoods <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/YAlikihoods.csv")

plot(YAlikihoods$YAratio,YAlikihoods$mle, pch=19,xaxt='n', xlab="Y/A Ne ratio", ylab="Likelihood")
axis(3)
abline(h=-2, lty=2, lwd=3)
segments(x0=0.09775,y0=-0.9,x1=0.09775,y1=-1.1,lwd=2, col="red")
segments(x0=0.009,y0=-0.9,x1=0.009,y1=-1.1,lwd=2, col="red")
#segments(x0=0.009,y0=1,x1=0.009,y1=-2,lwd=1,lty=2, col="black")
#segments(x0=0.09775,y0=1,x1=0.09775,y1=-2,lwd=1,lty=2, col="black")
legend("topright", c("likelihood credibility interval", "LRT significance cut-off"),
       cex=0.7, box.lty=0, lty=c(1,2),col=c("red","black"), lwd=c(2,2))
segments(0.009, -1, 0.09775, -1,lwd=2,code = 3,col="red")

#rect(0.009, -2, 0.09775, 1, density = NULL, angle = 45,
#     col="grey", border = NULL, lty = par("lty"), lwd = par("lwd"))

#cord.x=c(0.009,0.09775)
#cord.y=c(-2,-2)
#polygon(cord.x,cord.y, col=gray(0.8))
