
library(VIM)
library(FactoMineR)
library(factoextra)
library(missMDA)
library(pracma)
library(naniar)

folder="/Volumes/SPARK/olga_tree_isotopes/" # change folder here
setwd(folder)

# read in and modulate o18 data 

o18 <- read.table("GPC_data_o18.csv", header = TRUE,sep=";", row.names = 1)
mask=o18==0
o18[mask]=NA

o18_ts=ts(o18,start=1900,end=2021,freq=1)
o18_ts_19012000=window(o18_ts,start=1901,end=2000,freq=1)
o18_ts_19012000_detrend=detrend(o18_ts_19012000)
mean_detrend=apply(o18_ts_19012000_detrend,2,mean,na.rm=TRUE)
sd_detrend=apply(o18_ts_19012000_detrend,2,sd,na.rm=TRUE)

mean=apply(o18_ts_19012000,2,mean,na.rm=TRUE)
sd=apply(o18_ts_19012000,2,sd,na.rm=TRUE)


for (i in 1:ncol(o18_ts_19012000)) {
  o18_ts_19012000[,i]=(o18_ts_19012000[,i]-mean[i])/sd[i]
  
  
}  


for (i in 1:ncol(o18_ts_19012000_detrend)) {
  o18_ts_19012000_detrend[,i]=(o18_ts_19012000_detrend[,i]-mean_detrend[i])/sd_detrend[i]
  
  
}  




# read in and modulate d2h data 
d2h <- read.table("GPC_data_d2h.csv", header = TRUE,sep=";", row.names = 1)
mask=d2h==0
d2h[mask]=NA

d2h_ts=ts(d2h,start=1900,end=2021,freq=1)
d2h_ts_19012000=window(d2h_ts,start=1901,end=2000,freq=1)
d2h_ts_19012000_detrend=detrend(d2h_ts_19012000)
mean_detrend=apply(d2h_ts_19012000_detrend,2,mean,na.rm=TRUE)
sd_detrend=apply(d2h_ts_19012000_detrend,2,sd,na.rm=TRUE)

mean=apply(d2h_ts_19012000,2,mean,na.rm=TRUE)
sd=apply(d2h_ts_19012000,2,sd,na.rm=TRUE)

for (i in 1:ncol(d2h_ts_19012000)) {
  d2h_ts_19012000[,i]=(d2h_ts_19012000[,i]-mean[i])/sd[i]
  
  
}  


for (i in 1:ncol(d2h_ts_19012000_detrend)) {
  d2h_ts_19012000_detrend[,i]=(d2h_ts_19012000_detrend[,i]-mean_detrend[i])/sd_detrend[i]
  
  
}  




c13 <- read.table("GPC_data_13c.csv", header = TRUE,sep=";", row.names = 1)
mask=c13==0
c13[mask]=NA

c13_ts=ts(c13,start=1900,end=2020,freq=1)
c13_ts_19012000=window(c13_ts,start=1901,end=2000,freq=1)
c13_ts_19012000_detrend=detrend(c13_ts_19012000)

mean_detrend=apply(c13_ts_19012000_detrend,2,mean,na.rm=TRUE)
sd_detrend=apply(c13_ts_19012000_detrend,2,sd,na.rm=TRUE)

mean=apply(c13_ts_19012000,2,mean,na.rm=TRUE)
sd=apply(c13_ts_19012000,2,sd,na.rm=TRUE)
#


for (i in 1:ncol(c13_ts_19012000)) {
  c13_ts_19012000[,i]=(c13_ts_19012000[,i]-mean[i])/sd[i]
  
  
}  


for (i in 1:ncol(c13_ts_19012000_detrend)) {
  c13_ts_19012000_detrend[,i]=(c13_ts_19012000_detrend[,i]-mean_detrend[i])/sd_detrend[i]
  
  
}  





df_o18=data.frame(Y=as.matrix(o18_ts_19012000_detrend[,-9]), date=time(o18_ts_19012000_detrend))
df_c13=data.frame(Y=as.matrix(c13_ts_19012000_detrend), date=time(c13_ts_19012000_detrend))
df_d2h=data.frame(Y=as.matrix(d2h_ts_19012000_detrend), date=time(d2h_ts_19012000_detrend))




# fill in missing values for PCA analysis for o18

nb_o18 <- estim_ncpPCA(df_o18[,1:13],method.cv = "Kfold", verbose = FALSE) # estimate the number of components from incomplete data
nb_o18$ncp #2
plot(0:5, nb_o18$criterion, xlab = "nb dim", ylab = "MSEP")

res.comp_o18 <- imputePCA(df_o18[,1:13], ncp = nb_o18$ncp) # iterativePCA algorithm
res.comp_o18$completeObs[1:3,] # the imputed data set



# fill in missing values for PCA analysis for c13

nb_c13 <- estim_ncpPCA(df_c13[,1:18],method.cv = "Kfold", verbose = FALSE) # estimate the number of components from incomplete data
nb_c13$ncp #2
plot(0:5, nb_c13$criterion, xlab = "nb dim", ylab = "MSEP")

res.comp_c13 <- imputePCA(df_c13[,1:18], ncp = nb_o18$ncp) # iterativePCA algorithm
res.comp_c13$completeObs[1:3,] # the imputed data set



# calculate PCA for o18
res.pca_o18 <- prcomp(res.comp_o18$completeObs, scale = TRUE)
fviz_eig(res.pca_o18)

eig.val_o18 <- get_eigenvalue(res.pca_o18)

ind.coord_o18 <- res.pca_o18$x




# calculate PCA for c13


res.pca_c13 <- prcomp(res.comp_c13$completeObs, scale = TRUE)
fviz_eig(res.pca_c13)

eig.val_c13 <- get_eigenvalue(res.pca_c13)

ind.coord_c13 <- res.pca_c13$x





# calculate PCA for d2h

res.pca_d2h <- prcomp(df_d2h, scale = TRUE)
fviz_eig(res.pca_d2h)

eig.val_d2h <- get_eigenvalue(res.pca_d2h)


ind.coord_d2h <- res.pca_d2h$x





#write out PCs for o18
pc1_o18=ts(ind.coord_o18[,1],start=1901,end=2000,freq=1)
pc2_o18=ts(ind.coord_o18[,2],start=1901,end=2000,freq=1)
ts.plot(pc1_o18,main="pc1 o18")
ts.plot(pc2_o18,main="pc2 o18")

write.table(pc1_o18,"pc1_o18_boreal_trees.txt",col.names=FALSE, row.names = FALSE)
write.table(pc2_o18,"pc2_o18_boreal_trees.txt",col.names=FALSE, row.names = FALSE)




#write out PCs for c13

pc1_c13=ts(ind.coord_c13[,1],start=1901,end=2000,freq=1)
pc2_c13=ts(ind.coord_c13[,2],start=1901,end=2000,freq=1)
ts.plot(pc1_c13,main="pc1 c13")
ts.plot(pc2_c13,main="pc2 c13")

write.table(pc1_c13,"pc1_c13_boreal_trees.txt",col.names=FALSE, row.names = FALSE)
write.table(pc2_c13,"pc2_c13_boreal_trees.txt",col.names=FALSE, row.names = FALSE)




#write out PCs for d2h

pc1_d2h=ts(ind.coord_d2h[,1],start=1901,end=2000,freq=1)
pc2_d2h=ts(ind.coord_d2h[,2],start=1901,end=2000,freq=1)
ts.plot(pc1_c13,main="pc1 d2h")
ts.plot(pc2_c13,main="pc2 d2h")

write.table(pc1_d2h,"pc1_d2h_boreal_trees.txt",col.names=FALSE, row.names = FALSE)
write.table(pc2_d2h,"pc2_d2h_boreal_trees.txt",col.names=FALSE, row.names = FALSE)

