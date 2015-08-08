#====READ FILE==========
    setwd("C:/Users/Desktop/data-jam-august-2015-master")	
    dt<-read.csv("meetupdata-Aug-08-2015.csv",header=T)
   
#====FIND UNIQUE TOPICS LIST====
    tp <- as.character(dt$topics)
    allTP<-paste(as.character(dt$topics), collapse=",")
    all.tp<-unlist(strsplit(allTP,","))
    unique.tp<-unique(all.tp)
    
#====SEPARATE ALL TOPICS=====
    tp.list<-list()
    for(i in 1:length(tp)){
        tp.list[[i]]<-unlist(strsplit(tp[i],","))
    }

#====CREATE COLUMNS DATA FRAME=======
    col<-matrix(data=0,nrow=length(tp.list),ncol=length(unique.tp))
    for (j in 1:length(tp.list)){
        idx<-which(tp.list[[j]] %in% unique.tp)
        col[j,idx]<-1
    }
    colDF<-data.frame(col)
    names(colDF)<-unique.tp
  
#====OUTPUT PROCESSED FILES=======
    dt.output<-cbind(dt,colDF)
    write.csv(dt.output,"meetupdata-Aug-08-2015-mod.csv",row.names=F,col.names=T)
