
#read polymorphurama output (converted to .csv and parsed)
setwd("/Users/joshhough/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/")
ncx <- read.csv("ncx.csv")
ncy <- read.csv("ncy.csv")
txx <- read.csv("txx.csv")
txy <- read.csv("txy.csv")
scx <- read.csv("scx.csv")
scy <- read.csv("scy.csv")
flx <- read.csv("flx.csv")
fly <- read.csv("fly.csv")

#new columns=SynSitestot*theta_syntot (for each cell)
#calculate average weighted theta
#NC_X
ncx$weighted_theta <- ncx$SynSitestot * ncx$theta_syntot            
ncx_ave_weighted_theta=(sum(ncx$weighted_theta))/(sum(ncx$SynSitestot))
#NC_Y
ncy$weighted_theta <- ncy$SynSitestot * ncy$theta_syntot            
ncy_ave_weighted_theta=(sum(ncy$weighted_theta))/(sum(ncy$SynSitestot))
#TX_X
txx$weighted_theta <- txx$SynSitestot * txx$theta_syntot            
txx_ave_weighted_theta=(sum(txx$weighted_theta))/(sum(txx$SynSitestot))
#TX_Y
txy$weighted_theta <- txy$SynSitestot * txy$theta_syntot            
txy_ave_weighted_theta=(sum(txy$weighted_theta))/(sum(txy$SynSitestot))

#SC_X
scx$weighted_theta <- scx$SynSitestot * scx$theta_syntot            
scx_ave_weighted_theta=(sum(scx$weighted_theta))/(sum(scx$SynSitestot))
#SC_Y
scy$weighted_theta <- scy$SynSitestot * scy$theta_syntot            
scy_ave_weighted_theta=(sum(scy$weighted_theta))/(sum(scy$SynSitestot))
#Fl_X
flx$weighted_theta <- flx$SynSitestot * flx$theta_syntot            
flx_ave_weighted_theta=(sum(flx$weighted_theta))/(sum(flx$SynSitestot))
#Fl_Y
fly$weighted_theta <- fly$SynSitestot * fly$theta_syntot            
fly_ave_weighted_theta=(sum(fly$weighted_theta))/(sum(fly$SynSitestot))

barplot(c(#ncx_ave_weighted_theta,
          #ncy_ave_weighted_theta,
          txx_ave_weighted_theta,
          txy_ave_weighted_theta, 
          scx_ave_weighted_theta,
          scy_ave_weighted_theta,
          flx_ave_weighted_theta,
          fly_ave_weighted_theta),
        ylab=expression(paste("Nucleotide Diversity (average weighted ", theta, " )")),
        names.arg=c("TX_X","TX_Y","SC_X", "SC_Y", "FL_X", "FL_Y"),
        ylim=c(0,0.005))

####################
#autosomal diversity
#the following files are fully filtered autosomal genes from TX and NC 
tm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/tm_all_new.csv")
tf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/tf_all_new.csv")
nf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/nf_all_new.csv")
nm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/nm_all_new.csv")

#new files for filtered autosomal genes, separating out the sub-clades
scf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/scf_autosomes.csv")
scm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/scm_autosomes.csv")
flf_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/flf_autosomes.csv")
flm_all <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/flm_autosomes.csv")

#new columns=SynSitestot*theta_syntot (for each cell)
#calculate average weighted theta for each race, males and females separated

#Texas and North Carolina
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

#sub-clades
#scf_all
scf_all$weighted_theta <- scf_all$SynSitestot * scf_all$theta_syntot            
scf_all_ave_weighted_theta=(sum(scf_all$weighted_theta))/(sum(scf_all$SynSitestot))
#scm_all
scm_all$weighted_theta <- scm_all$SynSitestot * scm_all$theta_syntot            
scm_all_ave_weighted_theta=(sum(scm_all$weighted_theta))/(sum(scm_all$SynSitestot))
#flf_all
flf_all$weighted_theta <- flf_all$SynSitestot * flf_all$theta_syntot            
flf_all_ave_weighted_theta=(sum(flf_all$weighted_theta))/(sum(flf_all$SynSitestot))
#flm_all
flm_all$weighted_theta <- flm_all$SynSitestot * flm_all$theta_syntot            
flm_all_ave_weighted_theta=(sum(flm_all$weighted_theta))/(sum(flm_all$SynSitestot))

#X/A diversity (using female autosomes for A)
#Texas
tx_x_auto=txx_ave_weighted_theta/tf_all_ave_weighted_theta
#North Carolina
nc_x_auto=ncx_ave_weighted_theta/nf_all_ave_weighted_theta
#South Carolina
sc_x_auto=scx_ave_weighted_theta/scf_all_ave_weighted_theta
#Florida
fl_x_auto=flx_ave_weighted_theta/flf_all_ave_weighted_theta

#Y/A diversity
#Texas
tx_y_auto=txy_ave_weighted_theta/tf_all_ave_weighted_theta
#North Carolina
nc_y_auto=ncy_ave_weighted_theta/nf_all_ave_weighted_theta
#South Carolina
sc_y_auto=scy_ave_weighted_theta/scf_all_ave_weighted_theta
#Florida
fl_y_auto=fly_ave_weighted_theta/flf_all_ave_weighted_theta

#expectations equal sex ratio
#proportion(females) = r = 0.5 

#X/A
r=0.5
xA_exp_equal=((9*1000*r*(r - 1))/(2*(r - 2)))/(4*1000*(1 - r)*r)
#Y/A
yA_exp_equal=1/(8*r)

#expectations unequal sex ratio
#proportion(females) = r = 0.6
#X/A
r_2=0.6
xA_exp_06=((9*1000*r_2*(r_2 - 1))/(2*(r_2 - 2)))/(4*1000*(1 - r_2)*r_2)
#Y/A
yA_exp_06=1/(8*r_2)

#proportion(females) = r = 0.75
#X/A
r_3=0.75
xA_exp_075=((9*1000*r_3*(r_3 - 1))/(2*(r_3 - 2)))/(4*1000*(1 - r_3)*r_3)
#Y/A
yA_exp_075=1/(8*r_3)

#proportion(females) = r ≈ 1
#X/A
r_4=0.999999999999
xA_exp_1=((9*1000*r_4*(r_4 - 1))/(2*(r_4 - 2)))/(4*1000*(1 - r_4)*r_4)
#Y/A
yA_exp_1=1/(8*r_4)

#liklihood estimate of Y/A
tx_y_auto_mlhka=0.017

#just Texas
barplot(c(tx_x_auto, xA_exp_equal, xA_exp_06, xA_exp_075, xA_exp_1,
          tx_y_auto_mlhka,tx_y_auto, yA_exp_equal, yA_exp_06, yA_exp_075, yA_exp_1),
        ylim=c(0,1.2),col=c("darkgreen", "black", "gray22","gray73","gray87",
                            "red","darkgreen", "black", "gray22","gray73","gray87"),
        xlab="X/A                                                                    Y/A",
        ylab = expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")))
legend(x=8,y=1.2, c(expression(paste("likelihood ", theta, " ")),expression(paste("weighted mean ", theta, " ")),"Nf/(Nf+Nm) = 0.5", "Nf/(Nf+Nm) = 0.6", "Nf/(Nf+Nm) = 0.75","Nf/(Nf+Nm) ≈ 1"), 
       fill=c("red","darkgreen", "black", "gray22","gray73","gray87"), box.lty=0, cex=0.7)
legend(x=8,y=0.6, c("likelihood credibility intervals"),
       cex=0.7, box.lty=0,lty=c(1),col="red", lwd=3)
legend(x=8,y=0.45, c("bootstrapped confidence intervals"),
       cex=0.7, box.lty=0,lty=c(1),col="black", lwd=3)

#likelihood credibility intervals
#segments(x0=0.6, y0=0.89, x1=0.6, y1=1.19, lwd=3, col="black")
segments(x0=6.7, y0=0.001, x1=6.7, y1=0.1, lwd=3, col="red")

#bootstrapped confidence intervals X (obtained using boot function, using bootingtheta.R scripts)
lowerXA
upperXA
segments(x0=0.75,y0=lowerXA,x1=0.75,y1=upperXA,lwd=3, col="black")

#not used
#lowerYA=0.0001/tf_all_ave_weighted_theta; lowerYA
#upperYA=0.0002/tf_all_ave_weighted_theta; upperYA
#segments(x0=9,y0=lowerYA,x1=9,y1=upperYA,lwd=3, col="blue")
#abline(h=xA_exp_06, lty=2)
#abline(h=yA_exp_06, lty=2)

# Texas + other races
barplot(c(tx_x_auto, sc_x_auto, fl_x_auto, yesx, xA_exp_equal, xA_exp_06, xA_exp_075, xA_exp_1,
          tx_y_auto, sc_y_auto, fl_y_auto, yesy, yA_exp_equal, yA_exp_06, yA_exp_075, yA_exp_1),
        ylim=c(0,1.2),col=c("darkgreen","darkgreen","darkgreen","red","black", "gray22","gray73","gray87",
                            "darkgreen","darkgreen","darkgreen", "red","black", "gray22","gray73","gray87"),
        xlab="X/A                                                                    Y/A",
        ylab = expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
        names.arg=c("TX_X","SC_X","FL_X", "","","","","TX_Y","SC_Y","FL_Y","","","",""),
        cex.names=0.75)
legend(x=10,y=1.2, c(expression(paste("likelihood ", theta, " ")),expression(paste("weighted mean ", theta, " ")),"Nf/(Nf+Nm) = 0.5", "Nf/(Nf+Nm) = 0.6", "Nf/(Nf+Nm) = 0.75","Nf/(Nf+Nm) ≈ 1"), 
       fill=c("red","darkgreen", "black", "gray22","gray73","gray87"), box.lty=0, cex=0.7)
#legend(x=10,y=0.9, c("bootstrapped confidence interval"),
       cex=0.7, box.lty=0,lty=c(1),col="black", lwd=2)
#legend(x=10,y=0.82, c("likelihood credibility interval"),
#       cex=0.7, box.lty=0,lty=c(1),col="red", lwd=2)

#bootstrapped confidence intervals X
#TX
segments(x0=0.74,y0=lowerXA,x1=0.74,y1=upperXA,lwd=2, col="black")

#SC
segments(x0=1.9,y0=lowerSC_XA,x1=1.9,y1=upperSC_XA,lwd=2, col="black")

#FL
segments(x0=3,y0=lowerSC_XA,x1=3,y1=upperSC_XA,lwd=2, col="black")

#bootstrapped confidence intervals Y
#TX
lowerYA=0.0001/tf_all_ave_weighted_theta; lowerYA
upperYA=0.0002/tf_all_ave_weighted_theta; upperYA
segments(x0=9.1,y0=lowerYA,x1=9.1,y1=upperYA,lwd=2, col="black")
#SC
lowerYA_sc=0.0000/scf_all_ave_weighted_theta; lowerYA_sc
upperYA_sc=0.0003/scf_all_ave_weighted_theta; upperYA_sc
segments(x0=10.3,y0=lowerYA_sc,x1=10.3,y1=upperYA_sc,lwd=2, col="black")
#FL
lowerYA_fl=0.0000/flf_all_ave_weighted_theta; lowerYA_fl
upperYA_fl=0.0002/flf_all_ave_weighted_theta; upperYA_fl
segments(x0=11.5,y0=lowerYA_fl,x1=11.5,y1=upperYA_fl,lwd=2, col="black")


segments(x0=1,y0=1.1, x1=1.13,y1=1.1, lwd=2, col="black")


