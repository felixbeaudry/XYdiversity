#bootstrapping average weighted theta from polymorphurama output
library("boot")

#x-linked genes
txx$weighted_theta <- txx$SynSitestot * txx$theta_syntot            
txx_ave_weighted_theta=(sum(txx$weighted_theta))/(sum(txx$SynSitestot))

#data for x linked genes
a=txx$SynSitestot #stores the number of synonymous sites for X-linked genes in vector
b=txx$theta_syntot #stores theta synonymous for X-linked genes in vector

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

hist(z$t, breaks=50, col="grey",ylim=c(0,700), main="bootstrapped X-genes"
     ,xlab=expression(paste("boostrap replicate estimates of mean weighted ", theta, " ")))
abline(v=txx_ave_weighted_theta, col="red",lwd=3)
abline(v=0.0041,col="black", lwd=3)
abline(v=0.0053,col="black", lwd=3)

# histogram of boostrap replicate estimates
qqnorm(z$t)  # normal quantiles of replicate estimates
boot.ci(z, type = "bca")  # 95% confidence interval using BCa
boot.ci(z, type = "perc") # same using percentile method

#implied CI for X/A
lowerXA=0.0042/tf_all_ave_weighted_theta
upperXA=0.0054/tf_all_ave_weighted_theta

