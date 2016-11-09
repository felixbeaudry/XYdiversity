#autosomal diversity

tm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/tm_all.csv")
tf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/tf_all.csv")
nf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/nf_all.csv")
nm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/nm_all.csv")

#new columns=SynSitestot*theta_syntot (for each cell)
#calculate average weighted theta

#tf_all
tf_all$weighted_theta <- tf_all$SynSitestot * tf_all$theta_syntot            
tf_all_ave_weighted_theta=(sum(tf_all$weighted_theta))/(sum(tf_all$SynSitestot))
#tm_all
tm_all$weighted_theta <- tm_all$SynSitestot * tm_all$theta_syntot            
tm_all_ave_weighted_theta=(sum(tm_all$weighted_theta))/(sum(tm_all$SynSitestot))
#nf_all
nf_all$weighted_theta <- nf_all$SynSitestot * nf_all$theta_syntot            
nf_all_ave_weighted_theta=(sum(nf_all$weighted_theta))/(sum(nf_all$SynSitestot))
#nm_all
nm_all$weighted_theta <- nm_all$SynSitestot * nm_all$theta_syntot            
nm_all_ave_weighted_theta=(sum(nm_all$weighted_theta))/(sum(nm_all$SynSitestot))

#overall average weighted theta for autosomes:
mean_all=mean(c(tf_all_ave_weighted_theta, tm_all_ave_weighted_theta, nf_all_ave_weighted_theta, nm_all_ave_weighted_theta))
