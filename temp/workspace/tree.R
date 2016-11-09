install.packages("ape")
install.packages("phytools")
library(phytools)
library(ape)

mytree <- read.tree(file.choose()) 
mytree               # prints basic tree information
mytree$tip.label     # species names
mytree$edge.length   # lengths of all tree branches
mytree$edge          # identity of branches (from node, to node)

plot(mytree,cex=0.8)
is.rooted(mytree)

