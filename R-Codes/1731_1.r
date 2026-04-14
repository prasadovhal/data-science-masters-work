pii.hat<-function(n)
{
 plot(c(-1,1),c(1,-1))

 x <- runif(n, min = -1 , max = 1)
 y <- runif(n, min = -1 , max = 1)

 a <- (x*x+y*y) <= 1
 b <- (x*x+y*y) <= 1
 
 par(new=TRUE)
 plot(x,y,col="black")

 par(new=TRUE)
 plot(x[a],y[b],col="red")

 par(new=TRUE)
 rect(-1,-1,1,1)

 radius <- 1
 alpha <- seq(0,2*pi,length=120)
 par(new=TRUE)
 lines(radius*cos(alpha) , radius*sin(alpha))

 N0=sum(ifelse((sqrt(x*x+y*y) <= 1),1,0))
 print(N0)
 piN = 4 * N0 / n
 print(piN)
}

pii.cap<-function(k,n)
{
m<-replicate(k,pii.hat(n))

x11()
hist(m,breaks="FD")
abline(v=pi)
abline(v=pi,col="red")
par(new=TRUE)
abline(v=piN)
abline(v=piN,col="blue")
}


# run as pii.cap(k,n)

