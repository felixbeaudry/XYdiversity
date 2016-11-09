#making MLHKA infile.txt

#rename polymorphurama output file from TX_X
txx_mlhka=txx

#take names from "locus" column in txx_mlhka file,
#and remove everything after "T
test <- as.data.frame(sub("T.*$","",txx_mlhka$locus))

#replaced in excel
write.xlsx(test, file="test.xlsx")
write.xlsx(txx_mlhka, file="txx_mlhka.xlsx")
#load fixed file
txx_mlhka_fixed <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/txx_mlhka_fixed.csv")

#now do same with dNdSFreeRatioNCshared
test2 <- as.data.frame(sub("T.*$","",dNdSFreeRatioNCshared$LOC))
write.xlsx(test2, file="test2.xlsx")
dNdSFreeRatioNCshared_fixed <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/dNdSFreeRatioNCshared_fixed.csv")

crap <- merge(txx_mlhka_fixed, dNdSFreeRatioNCshared_fixed)
write.xlsx(crap, file="crap.xlsx")


#ok i think file called "crap" is good: it is a merge of txx_mlhla_fixed and dNdSFreeRatioNCshared_fixed
#make new column in crap for "D" =synsites tot* OUTS for D
crap$D_mlhka <- crap$SynSitestot * crap$OUTS

#fixing D column
write.xlsx(crap, file="crap2.xlsx")

#ok crap2 now has all relevant information. Copied this file as crap_infile in order to format for infile.txt for MLHKA
crap_infile <- read.csv("~/Dropbox/JoshDocuments/academic/University/University of Toronto/PhD/manuscripts/Hough et al. Pop gen X and Y/workspace/crap_infile.csv")
crap_infile$SynSitestot_rounded <- round(crap_infile$SynSitestot)

write.xlsx(crap_infile, file="crap_infile_top.xlsx")


#OK, things needed for MLHKA input, in order:
#1. Locus ID. This is locus
#2. L (size in BP). This is SynSitestot_rounded
#3. S (#segsites). This is S_Syntot
#4. n (sample size). This is samp_sizetot
#5. D (pairwise diffs). This is D_mlhka
#6. starting theta. This is theta_syntot (must change values equal to 0)
#7. inheritance scalar. Need to make this column

#also need to make Y chromosome row
round(sum(txy$SynSitestot))
mean(txy$theta_syntot)

#need to get sum of D_mlhka for Y genes
#fix names in locus
##
gene_names_dN_Y <- as.data.frame(sub("T.*$","",dNdSFreeRatioNCshared$LOC))
gene_names_txy <- as.data.frame(sub("T.*$","",txy$locus))


#merge
crap <- merge(txx_mlhka_fixed, dNdSFreeRatioNCshared_fixed)




