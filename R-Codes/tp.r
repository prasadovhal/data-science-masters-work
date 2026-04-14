pii.hat<-function(n)
{
 plot(c(-1,1),c(1,-1))

 x <- runif(n, min = -1 , max = 1)
 y <- runif(n, min = -1 , max = 1)

 plot(x,y)

 par(new=TRUE)
 rect(-1,-1,1,1)

 r <- 1
 theta <- seq(0,2*pi,length=120)
 par(new=TRUE)
 lines(r*cos(theta) , r*sin(theta))

 N0=sum(ifelse((sqrt(x*x+y*y) <= 1),1,0))

 piN = 4 * N0 / n
 print(piN)
} 

{
p<-replicate(N,pii.hat(n))
hist(p,breaks="FD")
abline(v=pi)
abline(v=pi,col="blue")
return(p)
}
