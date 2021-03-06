library(ggplot2)
divided.differences <- function(x, y, x0) {  
require(rSymPy)  
  n <- length(x)  
  q <- matrix(data = 0, n, n)  
  for(h in 1:n){
    q[h,1] <- y[h]  
  }
  f <- as.character(round(q[1,1], 5))  
  fi <- ''    
  for (i in 2:n) {
    for (j in i:n) {
      q[j,i] <- (q[j,i-1] - q[j-1,i-1]) / (x[j] - x[j-i+1])    
    }    
    fi <- paste(fi, '*(x - ', x[i-1], ')', sep = '', collapse = '')        
    f <- paste(f, ' + ', round(q[i,i], 5), fi, sep = '', collapse = '')  
    }
  x <- Var('x')   
  return(list('Interpolated Function'=f,'Divided Differences Table'=q))
  }

y=c(1.3, 1.85, 2.6, 2.7, 2.4, 2.15, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4, 0.7, 0.5, 0.25,-0.25,0   ,0.25  ,-0.5,-2,-3  ,-4  ,-4.8,-5.1,  -4,  -2, -1 ,0.1,  0.5,1.01, 1  ,1.01,   1.2 ,1  ,1.3)      
x=c(0.9 , 1.9 , 2.6, 3  , 3.9, 4.4 , 5  , 6   , 7 ,    8 ,  9.2,10.5,11.6,12.6, 13.3,   12,10.7,10    ,8.5 ,8 ,7.5 ,7   ,6   ,4.75,5.1 ,5.48,5.6, 5.52, 5   ,4.2 , 3.5,3   ,2.1   ,1.3,0.9)
p3x <- function(x) { 
  f <- x
}
datx=x[1:5]
daty=y[1:5]
divided.differences(datx,daty,2.5)
datx1=x[6:10]
daty1=y[6:10]
divided.differences(datx1,daty1,2.5)
datx2=x[11:15]
daty2=y[11:15]
divided.differences(datx2,daty2,2.5)
datx3=x[16:20]
daty3=y[16:20]
divided.differences(datx3,daty3,2.5)
datx4=x[21:25]
daty4=y[21:25]
divided.differences(datx4,daty4,2.5)
datx5=x[26:30]
daty5=y[26:30]
divided.differences(datx5,daty5,2.5)
datx6=x[30:35]
daty6=y[30:35]
divided.differences(datx6,daty6,2.5)


dat <- data.frame(cbind(x,y))
sc<- plot(dat,pch=20,cex=1,col="red",asp=1,xlab="x",ylab="y",main ="pato")+geom_point(size=2, col='blue') +stat_function(fun=p3x,size=1.25,alpha=0.4)
sc<- sc+scale_x_continuous(name="x",limits=c(0,20))+scale_y_continuous(name="fx",limits=c(0,2))+lines(x,y,type = "o", col = "blue")

