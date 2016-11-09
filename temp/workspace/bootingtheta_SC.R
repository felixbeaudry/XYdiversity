#bootstrapping average weighted theta from polymorphurama output
library("boot")

#x-linked genes

#data for x linked genes
a=scx$SynSitestot #stores the number of synonymous sites for X-linked genes in vector
b=scx$theta_syntot #stores theta synonymous for X-linked genes in vector

d <- cbind.data.frame(a, b, stringsAsFactors = FALSE) #stores a and b in data frame d

boot.function <- function(d,i){
  a <- d$a[i]
  b <- d$b[i]
  boot.function <- sum(a*b)/sum(a) # calculates average weighted theta from d
}

z <- boot(d, boot.function, R = 10000) #store 10000 bootstrap estimates of boot.function in z

print(z)    # bootstrap calculation of bias and SE
sd(z$t)     # another way to get the standard error
boot.ci(z, type="bca")

#hist(z$t, breaks=50, col="grey",ylim=c(0,700), main="bootstrapped X-genes"
#     ,xlab=expression(paste("boostrap replicate estimates of mean weighted ", theta, " ")))
#abline(v=txx_ave_weighted_theta, col="red",lwd=3)
#abline(v=0.0041,col="black", lwd=3)
#abline(v=0.0053,col="black", lwd=3)

# histogram of boostrap replicate estimates
#qqnorm(z$t)  # normal quantiles of replicate estimates

#implied range for X/A
lowerSC_XA=0.0014/tf_all_ave_weighted_theta
upperSC_XA=0.0025/tf_all_ave_weighted_theta


