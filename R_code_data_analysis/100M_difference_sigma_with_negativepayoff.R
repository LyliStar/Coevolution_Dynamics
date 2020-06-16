#############################################################################################################
# Writed by Xing
# Date 2019/08/07
# To analysis the interval time of M100
#############################################################################################################

setwd('D:/Simulation_data/190926_ancestor_position') # Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools) #D:/Simulation_data/test_mutime/new_test_data2/interval_time.txt

# Read data

interval_time1<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/T_difference1/ancestor_time/M100_0.01sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data1 <- as.data.frame(interval_time1)
M100 <- data1$V3 - data1$V2
M100_0.01sigma <- trunc(as.data.frame(M100))

interval_time2<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/T_difference2/ancestor_time/M100_0.1sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data2 <- as.data.frame(interval_time2)
M100_0.1 <- data2$V3 - data2$V2
M100_0.1sigma <- trunc(as.data.frame(M100_0.1))

interval_time3<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/T_difference3/ancestor_time/M100_1sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data3 <- as.data.frame(interval_time3)
M100_1 <- data3$V3 - data3$V2
M100_1sigma <- trunc(as.data.frame(M100_1))

interval_time4<- read.csv(file = 'D:/Simulation_data/190926_ancestor_position/T_difference4/ancestor_time/M100_2sigma.csv',header = F,sep =",",stringsAsFactors = FALSE)
data4 <- as.data.frame(interval_time4)
M100_2 <- data4$V3 - data4$V2
M100_2sigma <- trunc(as.data.frame(M100_2))

# Plotting
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))


p1 <- hist(M100_0.01sigma$M100,main="",col='white',freq=F,ylim=c(0,0.006),xlab="time",ylab="frequency",cex.main=1,cex.lab=1,font = 1)
text(150, 0.006, adj=0, 'sigma = 0.01')
p2 <- hist(M100_0.1sigma$M100_0.1,main="",col='white',freq=F,ylim=c(0,0.006),xlab="time",ylab="frequency",cex.main=1,cex.lab=1,font = 1)
text(150, 0.006, adj=0, 'sigma = 0.1')
p3 <- hist(M100_1sigma$M100_1,main="",col='white',freq=F,ylim=c(0,0.006),xlab="time",ylab="frequency",cex.main=1,cex.lab=1,font = 1)
text(150, 0.006, adj=0, 'sigma = 1')
p4 <- hist(M100_2sigma$M100_2,main="",col='white',freq=F,ylim=c(0,0.006),xlab="time",ylab="frequency",cex.main=1,cex.lab=1,font = 1)
text(150, 0.006, adj=0, 'sigma = 2')
par(opar)


