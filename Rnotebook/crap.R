kf=2 #mean number of offspring of females
km=2 #mean number of offspring of males
vm=2

#effect of male reproductive variance on male Ne
curve((Nm*(km-1))/((km-1)+(x/km))/N, from = 0, to = 1)

#1:1
mvalue=0.25
mhvalue=0.125
m1value=0.124875
m2value=0.125
m3value=0.125

barplot(c(mvalue,mhvalue,0.14375,0.141525,0.14))
