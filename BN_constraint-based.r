rm(list = ls(all = T))
library(grid);library("bnlearn"); library(Rgraphviz);library(forecast)

bn_df<-read.csv("mydata.csv",header=TRUE) 

abc<-boot.strength(bn_df, R=500, algorithm = "pc.stable")  
#abc<-boot.strength(bn_df, R=500, algorithm = "inter.iamb") 
ress<-averaged.network(abc)  #averaged model
plot(ress)



