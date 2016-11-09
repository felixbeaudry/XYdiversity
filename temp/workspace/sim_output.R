#new 

#Ychromosome
Y_npoly=16.49500
Y_thetapi=4.22218
Y_thetaw=4.41717

#x-chromosome
X_npoly=55.366667
X_thetapi=14.915749
X_thetaw=14.826552


#the A
A_npoly=73.005000
A_thetapi=19.566661
A_thetaw=19.549893



#A=A_npoly*A_thetaw;A
#X=X_npoly*X_thetaw;X
#Y=Y_npoly*Y_thetaw;Y


y$weighted_theta <- y$npoly * y$thetaw
yw=(sum(y$weighted_theta))/(sum(y$thetaw));yw

a$weighted_theta <- a$npoly * a$thetaw
aw=(sum(a$weighted_theta))/(sum(a$thetaw));aw

x$weighted_theta <- x$npoly * x$thetaw
xw=(sum(x$weighted_theta))/(sum(x$thetaw));xw

#xa=xw/aw;xa
#ya=yw/aw;ya

X

yesy=mean(y$weighted_theta)/mean(a$weighted_theta);yesy



weighted.mean(y$thetaw,y$npoly)/weighted.mean(a$thetaw,a$npoly)
weighted.mean(a$thetaw,a$npoly)


[1] 0.06062793
yesx=mean(x$weighted_theta)/mean(a$weighted_theta);yesx
[1] 0.5656107


boxplot(y$weighted_theta,x$weighted_theta, a$weighted_theta, col="grey", notch=T, 
        main="thetas from BGS simulations",
        ylab="theta*synsites",
        xlab="Y                  X                  A")

barplot(c(tx_x_auto, sc_x_auto, fl_x_auto, yesx, xA_exp_equal, xA_exp_06, xA_exp_075, xA_exp_1,
          tx_y_auto, sc_y_auto, fl_y_auto, yesy, yA_exp_equal, yA_exp_06, yA_exp_075, yA_exp_1),
        ylim=c(0,1.2),
    col=c("darkgreen","darkgreen","darkgreen","red","black", "gray22","gray73","gray87",
          "darkgreen","darkgreen","darkgreen", "red","black", "gray22","gray73","gray87"),
    xlab="X/A                                                                    Y/A",
    ylab = expression(paste("Nucleotide Diversity (", theta, " ) ")),
    names.arg=c("TX-X","SC-X","FL-X","X-BGS","","","","","TX-Y","SC-Y","FL-Y","Y-BGS","","","",""),
    cex.names=0.75)

legend(x=10,y=1.2, c(expression(paste("Observed ", theta, " ")),expression(paste("Simulated ", theta, " ")),"Predicted: Nf/N = 0.5", "Predicted: Nf/N = 0.6", "Predicted: Nf/N = 0.75","Predicted: Nf/N ≈ 1"), 
       fill=c("darkgreen","red", "black", "gray22","gray73","gray87"), box.lty=0, cex=0.9)




#some plots
par(mfrow=c(2,3))
hist(a$thetaw, breaks=40, col="grey")
hist(x$thetaw, breaks=40, col="grey")
hist(y$thetaw, breaks=40, col="grey")

hist(a$thetapi, breaks=40, col="grey")
hist(x$thetapi, breaks=40, col="grey")
hist(y$thetapi, breaks=40, col="grey")

boxplot(a$thetaw, x$thetaw, y$thetaw, col="grey", notch=T)
boxplot(a$thetapi, x$thetapi, y$thetapi, col="grey", notch=T)



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
segments(x0=12.5,y0=lowerYA_fl,x1=11.5,y1=upperYA_fl,lwd=2, col="black")


segments(x0=1,y0=1.1, x1=1.13,y1=1.1, lwd=2, col="black")








#Y_A_theta_bgs_sim=Y_thetaw/A_thetaw;Y_A_theta_bgs_sim
#X_A_theta_bgs_sim=X_thetaw/A_thetaw;X_A_theta_bgs_sim

weighted_Y_simtheta=weighted.mean(y$thetaw,y$npoly);weighted_Y_simtheta
weighted_X_simtheta=weighted.mean(x$thetaw,x$npoly);weighted_X_simtheta
weighted_A_simtheta=weighted.mean(a$thetaw,a$npoly);weighted_A_simtheta


YA_sim=weighted_Y_simtheta/weighted_A_simtheta;YA_sim
XA_sim=weighted_X_simtheta/weighted_A_simtheta;XA_sim



  #old
#x
#X_npoly=48.726667
#X_thetapi=12.927826
#X_thetaw=13.048437
#autosomes
#A_npoly=65.450000
#A_thetapi=17.387548
#A_thetaw=17.52675
#Y
#Y_npoly=15.778333
#Y_thetapi=4.166818
#Y_thetaw=4.225255

##some plots

boxplot(outline=F, notch=F, X/A,Y/A,
        main="simulated nucleotide diversity", col="gray",
        names=c("X/A","Y/A"))

boxplot(outline=F, notch=F, auto_sims$thetaw, x_sims$thetaw, y_sims$thetaw,
        main="theta_omega", col="gray",
        names=c("Autosome","X-chromosome","Y-chromosome"))

boxplot(outline=F, notch=F, auto_sims$thetapi, x_sims$thetapi, y_sims$thetapi,
        main="theta_pi", col="gray",
        names=c("Autosome","X-chromosome","Y-chromosome"))

boxplot(outline=F, notch=F, auto_sims$npoly, x_sims$npoly, y_sims$npoly,
        main="number of polymorphisms", col="gray",
        names=c("Autosome","X-chromosome","Y-chromosome"))



barplot(c(tx_x_auto, sc_x_auto, fl_x_auto, X/A, xA_exp_equal, xA_exp_06, xA_exp_075, xA_exp_1,
          tx_y_auto, sc_y_auto, fl_y_auto, Y/A, yA_exp_equal, yA_exp_06, yA_exp_075, yA_exp_1),
        ylim=c(0,1.2),col=c("darkgreen","darkgreen","darkgreen","red","black", "gray22","gray73","gray87",
                            "darkgreen","darkgreen","darkgreen", "red","black", "gray22","gray73","gray87"),
        xlab="X/A                                                                    Y/A",
        ylab = expression(paste("Nucleotide Diversity ( ", theta, " ) ratio")),
        names.arg=c("TX_X","SC_X","FL_X", "","","","","TX_Y","SC_Y","FL_Y","","","",""),
        cex.names=0.75)
legend(x=10,y=1.2, c(expression(paste("likelihood ", theta, " ")),expression(paste("weighted mean ", theta, " ")),"Nf/(Nf+Nm) = 0.5", "Nf/(Nf+Nm) = 0.6", "Nf/(Nf+Nm) = 0.75","Nf/(Nf+Nm) ≈ 1"), 
       fill=c("red","darkgreen", "black", "gray22","gray73","gray87"), box.lty=0, cex=0.7)
legend(x=10,y=0.9, c("bootstrapped confidence interval"),
       cex=0.7, box.lty=0,lty=c(1),col="black", lwd=2)
#legend(x=10,y=0.82, c("likelihood credibility interval"),
#       cex=0.7, box.lty=0,lty=c(1),col="red", lwd=2)