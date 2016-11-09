#bootstrapping average weighted theta from polymorphurama output
library("boot")
setwd("/Users/joshhough/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/")

txx <- read.csv("txx.csv")
txy <- read.csv("txy.csv")
scx <- read.csv("scx.csv")
scy <- read.csv("scy.csv")
flx <- read.csv("flx.csv")
fly <- read.csv("fly.csv")
scf_all <- read.csv("scf_autosomes.csv")
scm_all <- read.csv("scm_autosomes.csv")
flf_all <- read.csv("flf_autosomes.csv")
flm_all <- read.csv("flm_autosomes.csv")
tm_all <- read.csv("tm_all_new.csv")
tf_all <- read.csv("tf_all_new.csv")
scf_all <- read.csv("scf_autosomes.csv")
scm_all <- read.csv("scm_autosomes.csv")
flf_all <- read.csv("flf_autosomes.csv")
flm_all <- read.csv("flm_autosomes.csv")

#data for x linked genes
a=txx$SynSitestot #stores the number of synonymous sites for X-linked genes in vector
b=txx$theta_syntot #stores theta synonymous for X-linked genes in vector

#autosomal genes
p=tf_all$SynSitestot #stores the number of synonymous sites for autosomal genes in vector
q=tf_all$theta_syntot #stores theta synonymous for autosomal genes in vector

max.len = max(length(a), length(b), length(p), length(q))
a = c(a, rep(NA, max.len - length(a)))
b = c(b, rep(NA, max.len - length(b)))
p = c(p, rep(NA, max.len - length(p)))
q = c(q, rep(NA, max.len - length(q)))

d <- cbind.data.frame(a, b, p, q, stringsAsFactors = FALSE) #stores a and b in data frame d

boot.function <- function(d,i){
  a <- d$a[i]
  b <- d$b[i]
  p <- d$p[i]
  q <- d$q[i]
  boot.function <- (sum(a*b, na.rm=T)/sum(a, na.rm=T))/(sum(p*q, na.rm=T)/sum(p,na.rm=T)) # calculates average weighted theta from d
}

z <- boot(d, boot.function, R = 20000) #store 10000 bootstrap estimates of boot.function in z

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
#boot.ci(z, type = "bca")  # 95% confidence interval using BCa
#boot.ci(z, type = "perc") # same using percentile method

#implied range for X/A
#lowerXA=0.0041/tf_all_ave_weighted_theta
#upperXA=0.0053/tf_all_ave_weighted_theta

