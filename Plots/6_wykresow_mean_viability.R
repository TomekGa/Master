sel <- c("constant","variable")
hel <- c("constant","half_variable","variable")
for(i in 1:4){
  for(s in 1:2){
    for(h in 1:3){
      if(!(sel[s] == "constant" & hel[h] == "half_variable")){
        file.name <- paste("parametrymat",i,"s",sel[s],"h",hel[h],".txt",sep = "")
        name <- paste("p",i,s,h,sep = "")
        assign(name,read.table(file=file.name, sep="\t", header = T))
      }
    }
  }
}

pokolenia<-c(0:(nrow(p111)-1))
nazwy_parametrow<-colnames(p111)
kolory <- rainbow(2)
kolory <- c(kolory,"green")
dane <- 1
#dane.sd.dol <- p111[,dane]-(2*p111[,4])
#dane.sd.gora <- p111[,dane]-(2*p111[,4])
dolne.y <- 0.4
gorne.y <- 1.5
legenda.y <- gorne.y*0.75
parametr <- "mean_viability+mat4"

jpeg(paste(parametr,".jpg",sep = ""),width = 2000,height = 1500)
par(mfrow=c(2,3),xpd = NA)

plot(x=pokolenia, y=p111[,dane], type="l", xlab=NA,cex.lab=1.5,lwd = 5,ylab = NA,ylim = c(dolne.y,gorne.y),main=paste("s",sel[1],"h",hel[1]),cex.main=3,cex.lab=2,cex.axis=3)
lines(x=pokolenia,y=p211[,dane],type = "l",col = kolory[1],lwd=5) 
lines(x=pokolenia,y=p311[,dane],type = "l",col = kolory[2],lwd=5) 
lines(x=pokolenia,y=p411[,dane],type = "l",col = kolory[3],lwd=5)

plot(x=pokolenia, y=p113[,dane], type="l", xlab=NA,cex.lab=1.5,lwd = 5,ylab = NA,ylim = c(dolne.y,gorne.y),main=paste("s",sel[1],"h",hel[3]),cex.main=3,cex.lab=2,cex.axis=3)
lines(x=pokolenia,y=p213[,dane],type = "l",col = kolory[1],lwd=5) 
lines(x=pokolenia,y=p313[,dane],type = "l",col = kolory[2],lwd=5) 
lines(x=pokolenia,y=p413[,dane],type = "l",col = kolory[3],lwd=5)

plot(0,0,type = "n",axes = F)
#plot.new()

plot(x=pokolenia, y=p121[,dane], type="l", xlab=NA,cex.lab=1.5,lwd = 5,ylab =NA,ylim = c(dolne.y,gorne.y),main=paste("s",sel[2],"h",hel[1]),cex.main=3,cex.lab=2,cex.axis=3)
lines(x=pokolenia,y=p221[,dane],type = "l",col = kolory[1],lwd=5) 
lines(x=pokolenia,y=p321[,dane],type = "l",col = kolory[2],lwd=5) 
lines(x=pokolenia,y=p421[,dane],type = "l",col = kolory[3],lwd=5)

plot(x=pokolenia, y=p122[,dane], type="l", xlab=NA,cex.lab=1.5,lwd = 5,ylab = NA,ylim = c(dolne.y,gorne.y),main=paste("s",sel[2],"h",hel[2]),cex.main=3,cex.lab=2,cex.axis=3)
lines(x=pokolenia,y=p222[,dane],type = "l",col = kolory[1],lwd=5) 
lines(x=pokolenia,y=p322[,dane],type = "l",col = kolory[2],lwd=5) 
lines(x=pokolenia,y=p422[,dane],type = "l",col = kolory[3],lwd=5)

plot(x=pokolenia, y=p123[,dane], type="l", xlab=NA,cex.lab=1.5,lwd = 5,ylab =NA,ylim = c(dolne.y,gorne.y),main=paste("s",sel[2],"h",hel[3]),cex.main=3,cex.lab=2,cex.axis=3)
lines(x=pokolenia,y=p223[,dane],type = "l",col = kolory[1],lwd=5) 
lines(x=pokolenia,y=p323[,dane],type = "l",col = kolory[2],lwd=5) 
lines(x=pokolenia,y=p423[,dane],type = "l",col = kolory[3],lwd=5) 

legend(-7,par("usr")[4]+legenda.y,title = "MEAN RELATIVE VIABILITY",legend = c("Males with the smallest nr of mutations","Random mating","Smallest nr of common mutations","20 neutral loci with 20 allels"),col = c("black",kolory),text.font = 4,pch = 15,cex = 4)

dev.off()

#"5 neutral loci with 7 allels"


