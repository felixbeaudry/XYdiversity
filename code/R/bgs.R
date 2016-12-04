print(20*math.exp(-0.02/(0.1+0.005)))

curve(0.25*(exp(-(0.02/((2*x)+0)))), from=0, to=1,
      main="Expected Y/A diversity under BGS",
      xlab="selection coefficient (s)",
      ylab = expression(paste("E[", pi,"]")), las=1,
      ylim=c(0,0.3),
      xlim=c(0,0.2),lwd=3)
abline(h=0.2,lty=2)
abline(h=0.02,lty=1, col="red",lwd=3)
legend(x=0.12,y=0.3, cex=0.8, box.lty=0, c("Nf/(Nf+Nm) = 0.6","U = 0.02","h = 1","r = 0", expression(paste("", pi[0], paste(" = ",N[em]/2)))))

text(0.03,0.029, cex=1, expression(paste(, theta,)))
text(0.03,0.21,expression(paste(, pi[0],)))

0.2083333*(exp(-0.02/((2*0.02)+0)))



((9*N*0.6*(0.6-1)/(2*(0.6-2))))/(4*N*(1-0.6)*0.6)


((N*(1-0.6)/2)/(4*N*(1-0.6)*0.6)
)

(0.2083333*(exp(-(0.02/((2*0.1)+0))))
)


theta
Ne
u
h
r
U

pi_not=theta
