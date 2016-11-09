#sup fig1

par(mfrow=c(1,2))
barplot(c(tx_x_auto,
  tx_y_auto, 
  nc_x_auto,
  nc_y_auto),
  ylab=expression(paste("Relative Nucleotide Diversity (average weighted ", theta, " )")),
  names.arg=c("TX_X","TX_Y","NC_X", "NC_Y"),
  ylim=c(0,1),
  xlim=c(0,4),
  width=0.59,
  cex.names=0.75)

barplot(c(tx_x_auto,
  tx_y_auto, 
  sc_x_auto,
  sc_y_auto,
  fl_x_auto,
  fl_y_auto),
  #ylab=expression(paste("Nucleotide Diversity (average weighted ", theta, " )")),
  names.arg=c("TX_X","TX_Y","SC_X", "SC_Y", "FL_X", "FL_Y"),
  ylim=c(0,1),
  xlim=c(0,7),
  width=1,
  cex.names=0.75)