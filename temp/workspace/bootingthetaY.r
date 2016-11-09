#x-linked genes
txy$weighted_theta <- txx$SynSitestot * txx$theta_syntot            
txy_ave_weighted_theta=(sum(txy$weighted_theta))/(sum(txy$SynSitestot))

#data for y linked genes
p=fly$SynSitestot #stores the number of synonymous sites for y-linked genes in vector
q=fly$theta_syntot #stores theta synonymous for X-linked genes in vector

d2 <- cbind.data.frame(p, q, stringsAsFactors = FALSE) #stores a and b in data frame d

boot.function2 <- function(d2,i){
  p <- d2$p[i]
  q <- d2$q[i]
  boot.function2 <- sum(p*q)/sum(p) # calculates average weighted theta from d
}

z2 <- boot(d2, boot.function2, R = 10000) #store 10000 bootstrap estimates of boot.function in z

print(z2)    # bootstrap calculation of bias and SE
sd(z2$t)     # another way to get the standard error

#hist(z2$t, breaks=50, col="grey",ylim=c(0,700), main="bootstrapped Y genes"
#     ,xlab=expression(paste("boostrap replicate estimates of mean weighted ", theta, " ")))
#abline(v=txy_ave_weighted_theta, col="red",lwd=3)
#abline(v=0.0001,col="black", lwd=3)
#abline(v=0.0002,col="black", lwd=3)

# histogram of boostrap replicate estimates
#qqnorm(z2$t)  # normal quantiles of replicate estimates
boot.ci(z2, type = "bca")  # 95% confidence interval using BCa
#boot.ci(z2, type = "perc") # same using percentile method

#implied range for X/A
#lowerYA=0.0001/tf_all_ave_weighted_theta; lowerYA
#upperYA=0.0002/tf_all_ave_weighted_theta; upperYA

