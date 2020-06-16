
#############################################################################################################
# Writed by Xing
# Date 2019/11/14
# To analysis the interval time of M500 sigma = 0.1
#############################################################################################################

setwd('D:/Simulation_data/191114_M500_intervalTime') # Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools) #D:/Simulation_data/test_mutime/new_test_data2/interval_time.txt
windowsFonts(myFont = windowsFont("Times New Roman")) # set font type
# Read data

interval_time1<- read.csv(file = 'D:/Simulation_data/191114_M500_intervalTime/500M_0.1sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data1 <- as.data.frame(interval_time1)
M500_ancestor <- data1$V3 - data1$V2
M500_0.1sigma_ancestor <- trunc(as.data.frame(M500_ancestor))

interval_time2<- read.csv(file = 'D:/Simulation_data/191114_M500_intervalTime/500M_0.1sigma_mutant.csv',header = F,sep =",",stringsAsFactors = FALSE)
data2 <- as.data.frame(interval_time2)
M500_mutant <- data2$V3 - data2$V2
M500_0.1sigma_mutant <- trunc(as.data.frame(M500_mutant))


newdata<-M500_0.1sigma_mutant[which(M500_mutant >= 400),]
data3 <- as.data.frame(newdata)

mutant_interval_time2<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/mutant_interval_time/greater_than400/inter2_time.csv',header = T,sep =",",stringsAsFactors = FALSE)
data4 <- as.data.frame(mutant_interval_time2)

interval_time2_ances<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/1000simulations_of_ancestor/M100_0.1sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data5 <- as.data.frame(interval_time2_ances)
M100_0.1 <- data5$V3 - data5$V2
M100_0.1sigma <- trunc(as.data.frame(M100_0.1))

# Plotting
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))

p1 <- hist(M500_0.1sigma_ancestor$M500,main="",col='white',freq=F,ylim=c(0,0.008),xlab="time\n(a)",ylab="Ancestor    frequency",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.0075, adj=0, 'M = 500\nsigma = 0.1')

p4 <- hist(M100_0.1sigma$M100_0.1,main="",col='white',freq=F,ylim=c(0,0.008),xlab="time\n(b)",ylab="frequency",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.0075, adj=0, 'M = 100\nsigma = 0.1')

p2 <- hist(data3$newdata,main="",col='white',freq=F,ylim=c(0,0.008),xlab="time\n(c)",ylab="Mutant    frequency",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.0075, adj=0, 'M = 500\nsigma = 0.1')

p3 <- hist(data4$I,main="",col='white',freq=F,ylim=c(0,0.008),xlab="time\n(d)",ylab="",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.0075, adj=0, 'M = 100\nsigma = 0.1')


par(opar)