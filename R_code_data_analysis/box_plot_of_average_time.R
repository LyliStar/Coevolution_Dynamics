#############################################################################################################
# Writed by Xing
# Date 2019/06/29
# To analysis the interval time of mutant populations, plotting this p1,p2,p3,p4 figures.
#############################################################################################################

setwd("D:/Simulation_data/data_both_dynamic/time/Number_mutant")# Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools)

windowsFonts(myFont = windowsFont("Times New Roman")) # set font type

# Read data
Mutant_number1 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/All_M100/All_Mu_M100.txt",
                               header = F,sep =",",stringsAsFactors = FALSE)
Mutant_number2 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/All_M500/All_Mu_M500.txt",
                               header = F,sep =",",stringsAsFactors = FALSE)
Mutant_number3 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/All_M1000/All_Mu_M1000.txt",
                                header = F,sep =",",stringsAsFactors = FALSE)
Mutant_number4 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/All_M1500/All_Mu_M1500.txt",
                                header = F,sep =",",stringsAsFactors = FALSE)
# Adds 100 lines of duplicate strings
Factor1 <- rep("M100",times = 100)
Factor2 <- rep("M500",times = 100)
Factor3 <- rep("M1000",times = 100)
Factor4 <- rep("M1500",times = 100)
# Merge datasets by column 
Mutant_number_M100 <- cbind(Factor1,Mutant_number1)
Mutant_number_M500 <- cbind(Factor2,Mutant_number2)
Mutant_number_M1000 <- cbind(Factor3,Mutant_number3)
Mutant_number_M1500 <- cbind(Factor4,Mutant_number4)
# Rename the the column's name
Mutant_number_M100 <- rename(Mutant_number_M100, c( Factor1 = "Factor"))
Mutant_number_M500 <- rename(Mutant_number_M500, c( Factor2 = "Factor"))
Mutant_number_M1000 <- rename(Mutant_number_M1000, c(Factor3 = "Factor"))
Mutant_number_M1500 <- rename(Mutant_number_M1500, c( Factor4 = "Factor"))

All_M <- rbind(Mutant_number_M100,Mutant_number_M500,Mutant_number_M1000,Mutant_number_M1500) # Merge datasets by row
# Plotting
f1 <- ggplot(All_M,aes(x=factor(Factor),y=V1)) + geom_boxplot(aes(fill=Factor)) + theme(axis.title.y = element_text(size = 12, family = "myFont"))
f1 <- f1 +  xlab("Different M Values") + ylab("Interval Time") + theme(axis.title.x = element_text(size = 12, family = "myFont"))
f1 <- f1 + scale_y_continuous(breaks=seq(0, 500, 50))
f1