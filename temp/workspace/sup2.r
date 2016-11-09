barplot(c(
  tf_all_ave_weighted_theta,
  scf_all_ave_weighted_theta,
  flf_all_ave_weighted_theta),
  ylab=expression(paste("Nucleotide Diversity (average weighted ", theta, " )")),
  names.arg=c("TX","SC","FL"), xlim=c(0,3),width=0.5,ylim=c(0,0.007))

#autosomes 
flf_all$weighted_theta <- flf_all$SynSitestot * flf_all$theta_syntot            
flf_all_ave_weighted_theta=(sum(flf_all$weighted_theta))/(sum(flf_all$SynSitestot))

p=flf_all$SynSitestot #stores the number of synonymous sites for y-linked genes in vector
q=flf_all$theta_syntot #stores theta synonymous for X-linked genes in vector

d2 <- cbind.data.frame(p, q, stringsAsFactors = FALSE) #stores a and b in data frame d

boot.function2 <- function(d2,i){
  p <- d2$p[i]
  q <- d2$q[i]
  boot.function2 <- sum(p*q)/sum(p) # calculates average weighted theta from d
}

z2 <- boot(d2, boot.function2, R = 15000) #store 10000 bootstrap estimates of boot.function in z

print(z2)    # bootstrap calculation of bias and SE
sd(z2$t)     # another way to get the standard error

boot.ci(z2, type = "perc")  # 95% confidence interval using perc

#TX
lowerTX=0.0053
upperTX=0.0058 
segments(x0=0.35,y0=lowerTX,x1=0.35,y1=upperTX,lwd=2, col="black")

#SC
lowerSC=0.0054
upperSC=0.0062
segments(x0=0.95,y0=lowerSC,x1=0.95,y1=upperSC,lwd=2, col="black")

#FL
lowerFL=0.0045
upperFL=0.0051
segments(x0=1.54,y0=lowerFL,x1=1.54,y1=upperFL,lwd=2, col="black")

