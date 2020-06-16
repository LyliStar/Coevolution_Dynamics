#############################################################################################################
# Writed by Xing
# Date 2019/06/30
# To analysis the interval time of mutant populations, plotting this p1,p2,p3,p4 figures.
#############################################################################################################

setwd("D:/Simulation_data/data_both_dynamic/population") #设定工作目录为D盘

library(ggplot2)
library("plyr")
library(ggpubr)
library(devtools)

a_M100 = list.files("population_list_M100")  
b_M100 = list.files("time_list_M100")     #list.files命令将input文件夹下所有文件名输入
dir1 = paste("./population_list_M100/",a_M100,sep="") 
dir2 = paste("./time_list_M100/",b_M100,sep ="") #用paste命令构建路径变量dir
n = length(dir1)                                #读取dir长度，也就是文件夹下的文件个数
merge.data1 = read.csv(file = dir1[1],header=F,sep="/") 
merge.data2 = read.csv(file = dir2[1],header=F,sep="/")#读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间，我选择先读入一个文件。
for (i in 2:n){
  new.data1 = read.csv(file = dir1[i], header=F, sep="/")
  new.data2 = read.csv(file = dir2[i], header=F, sep="/")
  merge.data1 = rbind(merge.data1,new.data1)
  merge.data2 = rbind(merge.data2,new.data2)
}
merge.data1 <- rename(merge.data1, c( V1 = "Population"))
merge.data2 <- rename(merge.data2, c( V1 = "Time"))
merge.data_M100 = cbind(merge.data2,merge.data1)

#循环从第二个文件开始读入所有文件，并组合到merge.data变量中
write.csv(merge.data_M100,file = "D:/Simulation_data/data_both_dynamic/population/population_data_merge/merge_M100.csv",row.names=F)  #输出组合后的文件merge.csv到input文件夹,colour=Species ,fill="Tomato" geom_point(colour="white",shape=21,size=4)
Merge_M100 <- read.csv("D:/Simulation_data/data_both_dynamic/population/population_data_merge/merge_M100.csv",header = T,sep=",")

a_M500 = list.files("population_list_M500")  
b_M500 = list.files("time_list_M500")     #list.files命令将input文件夹下所有文件名输入
dir3 = paste("./population_list_M500/",a_M500,sep="") 
dir4 = paste("./time_list_M500/",b_M500,sep ="") #用paste命令构建路径变量dir
n = length(dir3)                                #读取dir长度，也就是文件夹下的文件个数
merge.data3 = read.csv(file = dir3[1],header=F,sep="/") 
merge.data4 = read.csv(file = dir4[1],header=F,sep="/")#读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间，我选择先读入一个文件。
for (i in 2:n){
  new.data3 = read.csv(file = dir3[i], header=F, sep="/")
  new.data4 = read.csv(file = dir4[i], header=F, sep="/")
  merge.data3 = rbind(merge.data3,new.data3)
  merge.data4 = rbind(merge.data4,new.data4)
}
merge.data3 <- rename(merge.data3, c( V1 = "Population")) 
merge.data4 <- rename(merge.data4, c( V1 = "Time")) #对数据文件重命名
merge.data_M500 = cbind(merge.data3,merge.data4)

#循环从第二个文件开始读入所有文件，并组合到merge.data变量中
write.csv(merge.data_M500,file = "D:/Simulation_data/data_both_dynamic/population/population_data_merge/merge_M500.csv",row.names=F)  #输出组合后的文件merge.csv到input文件夹,colour=Species ,fill="Tomato" geom_point(colour="white",shape=21,size=4)
Merge_M500 <- read.csv("D:/Simulation_data/data_both_dynamic/population/population_data_merge/merge_M500.csv",header = T,sep=",")

f1 <- ggplot(Merge_M100,aes(Time,Population,colour = Time))+geom_point(size = 0.1)

f2 <- ggplot(Merge_M500,aes(Time,Population,colour = Time))+geom_point(size = 0.01)

p <-ggarrange(f1,f2,ncol=1,nrow=2,labels=c("a","b")) 
p
