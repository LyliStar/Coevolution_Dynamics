#############################################################################################################
# Writed by Xing
# Date 2019/09/30
# To analysis the interval time of all mutants when M = 100 and T =2000 under different sigma values
#############################################################################################################

setwd('D:/Simulation_data/190926_ancestor_position/mutant_interval_time') # Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools) #D:/Simulation_data/test_mutime/new_test_data2/interval_time.txt

# Read data

mutant_interval_time1<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/mutant_interval_time/greater_than400/inter1_time.csv',header = T,sep =",",stringsAsFactors = FALSE)
data1 <- as.data.frame(mutant_interval_time1)

mutant_interval_time2<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/mutant_interval_time/greater_than400/inter2_time.csv',header = T,sep =",",stringsAsFactors = FALSE)
data2 <- as.data.frame(mutant_interval_time2)

mutant_interval_time3<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/mutant_interval_time/greater_than400/inter3_time.csv',header = T,sep =",",stringsAsFactors = FALSE)
data3 <- as.data.frame(mutant_interval_time3)

mutant_interval_time4<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/mutant_interval_time/greater_than400/inter4_time.csv',header = T,sep =",",stringsAsFactors = FALSE)
data4 <- as.data.frame(mutant_interval_time4)

opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))

p1 <- hist(data1$I,main="",col='white',freq=F,ylim=c(0,0.01),xlab="",ylab="Mutant frequency",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.01, adj=0, 'sigma = 0.01')
p2 <- hist(data2$I,main="",col='white',freq=F,ylim=c(0,0.01),xlab="",ylab="",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.01, adj=0, 'sigma = 0.1')
p3 <- hist(data3$I,main="",col='white',freq=F,ylim=c(0,0.01),xlab="time",ylab="Mutant frequency",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.01, adj=0, 'sigma = 1')
p4 <- hist(data4$I,main="",col='white',freq=F,ylim=c(0,0.01),xlab="time",ylab="",cex.main=1,cex.lab=1,font = 1)
text(1400, 0.01, adj=0, 'sigma = 2')
par(opar)

