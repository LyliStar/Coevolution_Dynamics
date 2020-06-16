#############################################################################################################
# Writed by Xing
# Date 2019/07/1
# To analysis the interval time of mutant populations, plotting this p1,p2,p3,p4 figures.
#############################################################################################################

setwd("D:/Simulation_data/data_both_dynamic/time/Number_mutant/")# Set the path
# Import packages
library(ggplot2)
library(plyr)
library(ggpubr)
library(devtools)
library(stringr)
# Read data files
windowsFonts(myFont = windowsFont("Times New Roman")) # set font type

survival_T200_M100 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time200/M100_population/Time200_data.txt",
                                   header = F,sep =",",stringsAsFactors = FALSE)
survival_T400_M100 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time400/M100_population/Time400_data.txt",
                                  header = F,sep =",",stringsAsFactors = FALSE)
survival_T600_M100 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time600/M100_population/Time600_data.txt",
                                   header = F,sep =",",stringsAsFactors = FALSE)
survival_T800_M100 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time800/M100_population/Time800_data.txt",
                                  header = F,sep =",",stringsAsFactors = FALSE)
survival_T1000_M100 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time1000/M100_population/Time1000_data.txt",
                                    header = F,sep =",",stringsAsFactors = FALSE)

survival_T200_M500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time200/M500_population/Time200_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T400_M500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time400/M500_population/Time400_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T600_M500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time600/M500_population/Time600_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T800_M500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time800/M500_population/Time800_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T1000_M500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time1000/M500_population/Time1000_data.txt",
                                  header = F,sep =",",stringsAsFactors = FALSE)

survival_T200_M1000 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time200/M1000_population/Time200_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T400_M1000 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time400/M1000_population/Time400_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T600_M1000 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time600/M1000_population/Time600_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T800_M1000 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time800/M1000_population/Time800_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T1000_M1000 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time1000/M1000_population/Time1000_data.txt",
                                  header = F,sep =",",stringsAsFactors = FALSE)

survival_T200_M1500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time200/M1500_population/Time200_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T400_M1500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time400/M1500_population/Time400_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T600_M1500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time600/M1500_population/Time600_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T800_M1500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time800/M1500_population/Time800_data.txt",
                                 header = F,sep =",",stringsAsFactors = FALSE)
survival_T1000_M1500 <- read.table(file = "D:/Simulation_data/data_both_dynamic/time/Number_mutant/allM_Survival_with_time/Time1000/M1500_population/Time1000_data.txt",
                                  header = F,sep =",",stringsAsFactors = FALSE)

#数据分列
M100_T200 <- str_split_fixed(survival_T200_M100$V1, " ", 2)
M100_T400 <- str_split_fixed(survival_T400_M100$V1, " ", 2)
M100_T600 <- str_split_fixed(survival_T600_M100$V1, " ", 2)
M100_T800 <- str_split_fixed(survival_T800_M100$V1, " ", 2)
M100_T1000 <- str_split_fixed(survival_T1000_M100$V1, " ", 2)

M500_T200 <- str_split_fixed(survival_T200_M500$V1, " ", 2)
M500_T400 <- str_split_fixed(survival_T400_M500$V1, " ", 2)
M500_T600 <- str_split_fixed(survival_T600_M500$V1, " ", 2)
M500_T800 <- str_split_fixed(survival_T800_M500$V1, " ", 2)
M500_T1000 <- str_split_fixed(survival_T1000_M500$V1, " ", 2)

M1000_T200 <- str_split_fixed(survival_T200_M1000$V1, " ", 2)
M1000_T400 <- str_split_fixed(survival_T400_M1000$V1, " ", 2)
M1000_T600 <- str_split_fixed(survival_T600_M1000$V1, " ", 2)
M1000_T800 <- str_split_fixed(survival_T800_M1000$V1, " ", 2)
M1000_T1000 <- str_split_fixed(survival_T1000_M1000$V1, " ", 2)

M1500_T200 <- str_split_fixed(survival_T200_M1500$V1, " ", 2)
M1500_T400 <- str_split_fixed(survival_T400_M1500$V1, " ", 2)
M1500_T600 <- str_split_fixed(survival_T600_M1500$V1, " ", 2)
M1500_T800 <- str_split_fixed(survival_T800_M1500$V1, " ", 2)
M1500_T1000 <- str_split_fixed(survival_T1000_M1500$V1, " ", 2)

# 转换成数据框
T200_M100 <- as.data.frame(M100_T200)
T400_M100 <- as.data.frame(M100_T400)
T600_M100 <- as.data.frame(M100_T600)
T800_M100 <- as.data.frame(M100_T800)
T1000_M100 <- as.data.frame(M100_T1000)

T200_M500 <- as.data.frame(M500_T200)
T400_M500 <- as.data.frame(M500_T400)
T600_M500 <- as.data.frame(M500_T600)
T800_M500 <- as.data.frame(M500_T800)
T1000_M500 <- as.data.frame(M500_T1000)

T200_M1000 <- as.data.frame(M1000_T200)
T400_M1000 <- as.data.frame(M1000_T400)
T600_M1000 <- as.data.frame(M1000_T600)
T800_M1000 <- as.data.frame(M1000_T800)
T1000_M1000 <- as.data.frame(M1000_T1000)

T200_M1500 <- as.data.frame(M1500_T200)
T400_M1500 <- as.data.frame(M1500_T400)
T600_M1500 <- as.data.frame(M1500_T600)
T800_M1500 <- as.data.frame(M1500_T800)
T1000_M1500 <- as.data.frame(M1500_T1000)

# 将因子型变量转换为数值型
new_T200<-subset(T200_M100)
new_T200["Rate"] <- NA
new_T200$Rate <-as.numeric(as.character(new_T200[,2]))/as.numeric(as.character(new_T200[,1]))

new_T400<-subset(T400_M100)
new_T400["Rate"] <- NA
new_T400$Rate <-as.numeric(as.character(new_T400[,2]))/as.numeric(as.character(new_T400[,1]))

new_T600<-subset(T600_M100)
new_T600["Rate"] <- NA
new_T600$Rate <-as.numeric(as.character(new_T600[,2]))/as.numeric(as.character(new_T600[,1]))

new_T800<-subset(T800_M100)
new_T800["Rate"] <- NA
new_T800$Rate <-as.numeric(as.character(new_T800[,2]))/as.numeric(as.character(new_T800[,1]))

new_T1000<-subset(T1000_M100)
new_T1000["Rate"] <- NA
new_T1000$Rate <-as.numeric(as.character(new_T1000[,2]))/as.numeric(as.character(new_T1000[,1]))

Average1 <- mean(new_T200$Rate, na.rm=T)

Average2 <- mean(new_T400$Rate, na.rm=T)

Average3 <- mean(new_T600$Rate, na.rm=T)

Average4 <- mean(new_T800$Rate, na.rm=T)

Average5 <- mean(new_T1000$Rate, na.rm=T)
##合并数据框
Average_Rate <- rbind(Average1,Average2,Average3,Average4,Average5)
Average_Rate_Rverse <- rbind(0.8192,0.904882,0.994316,0.963183,0.964715)
Time1 <- rbind(200, 400, 600, 800, 1000)
Time2 <- rbind(200, 400, 600, 800, 1000)
Survival_Rate_withtime1 <- as.data.frame(cbind(Average_Rate,Time1))
Survival_Rate_withtime2 <- as.data.frame(cbind(Average_Rate_Rverse,Time2))
type <- rbind("1","1","1","1","1","2","2","2","2","2")
Survival_Rate_withtime <- rbind(Survival_Rate_withtime1,Survival_Rate_withtime2)
Survival_Rate <- cbind(Survival_Rate_withtime,type)
##画散点图
p <- ggplot(Survival_Rate_withtime , aes(x=V2, y=V1,shape=type)) + geom_point(size=2.5,colour="red") 
p <- p + theme(axis.title.x = element_text(size = 10, family = "myFont")) + xlab("Time")
p <- p + ylab("Population Survival Rate And Death Rate") + theme(axis.title.y = element_text(size = 10, family = "myFont"))
p