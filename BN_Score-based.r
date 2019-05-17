rm(list = ls(all = T))
library(grid);library("bnlearn"); library(Rgraphviz);library(forecast)

bn_df<-read.csv("mydata.csv",header=TRUE) 

nodes = names(bn_df)
start = random.graph(nodes = nodes, method = "ic-dag",
                     num = 500, every = 50) #every=50
netlist = lapply(start,
                 function(net) {
                 
                 hc(bn_df, start = net,score = "bic-g")
                 
                 }               
)
abcd = custom.strength(netlist, nodes = nodes)
  
abcd<-abcd[(abcd$strength > 0.85) & (abcd$direction >= 0.5), ]
ress<-averaged.network(abcd)#averaged model
plot(ress)
graphviz.plot(ress)
