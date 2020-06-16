#############################################################################################################
# Writed by Xing
# Date 2019/06/28
# To analysis the interval time of mutant populations, plotting this p1,p2,p3,p4 figures.
#############################################################################################################

setwd("D:/Simulation_data/data_both_dynamic/time/multimutant_time/timeinterval_data_analysis") # Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools)

windowsFonts(myFont = windowsFont("Times New Roman")) # set font type
# Read data
interval_time_M100 <- read.csv(file = "D:/Simulation_data/data_both_dynamic/time/multimutant_time/interval_time_M100/time3.csv",
                           header = F,sep =",",stringsAsFactors = FALSE)
interval_time_M500 <- read.csv(file = "D:/Simulation_data/data_both_dynamic/time/multimutant_time/interval_time_M500/time0.csv",
                           header = F,sep =",",stringsAsFactors = FALSE)
interval_time_M1000 <- read.csv(file = "D:/Simulation_data/data_both_dynamic/time/multimutant_time/interval_time_M1000/time0.csv",
                           header = F,sep =",",stringsAsFactors = FALSE)
interval_time_M1500 <- read.csv(file = "D:/Simulation_data/data_both_dynamic/time/multimutant_time/interval_time_M1500/time3.csv",
                           header = F,sep =",",stringsAsFactors = FALSE)
# Plotting
p1 <- ggplot(interval_time_M100,aes(interval_time_M100$V1)) + geom_histogram(aes(weight=1),binwidth=1,fill="blue",colour="black")
p1 <- p1 + scale_x_continuous(breaks=seq(0, 985, 85))+ xlab("Time")  + ylab("The Count of Time Interval M100")+theme(panel.grid = element_blank()) 
p1 <- p1 + theme(axis.title.x = element_text(size = 10, family = "myFont")) + theme(axis.title.y = element_text(size = 10, family = "myFont"))
p1 <- p1 + scale_y_continuous(breaks=seq(0, 10, 1))

p2 <- ggplot(interval_time_M500,aes(interval_time_M500$V1))+geom_histogram(aes(weight=1),binwidth=1,fill="blue",colour="black")
p2 <- p2 + scale_x_continuous(breaks=seq(0, 660, 85)) + xlab("Time") + ylab("The Count of Time Interval M500")+theme(panel.grid = element_blank()) 
p2 <- p2 + theme(axis.title.x = element_text(size = 10, family = "myFont")) + theme(axis.title.y = element_text(size = 10, family = "myFont")) 
p2 <- p2 + scale_y_continuous(breaks=seq(0, 30, 2))

p3 <- ggplot(interval_time_M1000,aes(interval_time_M1000$V1))+geom_histogram(aes(weight=1),binwidth=1,fill="blue",colour="black")
p3 <- p3 + scale_x_continuous(breaks=seq(0, 660, 85)) + xlab("Time") + ylab("The Count of Time Interval M1000")+theme(panel.grid = element_blank()) 
p3 <- p3 + theme(axis.title.x = element_text(size = 10, family = "myFont")) + theme(axis.title.y = element_text(size = 10, family = "myFont"))
p3 <- p3 + scale_y_continuous(breaks=seq(0, 80, 8))

p4 <- ggplot(interval_time_M1500,aes(interval_time_M1500$V1))+geom_histogram(aes(weight=1),binwidth=1,fill="blue",colour="black")
p4 <- p4 + scale_x_continuous(breaks=seq(0, 985, 85)) + xlab("Time") + ylab("The Count of Time Interval M1500")+theme(panel.grid = element_blank()) 
p4 <- p4 + theme(axis.title.x = element_text(size = 10, family = "myFont")) + theme(axis.title.y = element_text(size = 10, family = "myFont"))
p4 <- p4 + scale_y_continuous(breaks=seq(0, 105, 10))

ggarrange(p1,p2,p3,p4,ncol=2,nrow=2,labels=c("A","B","C","D")) 
