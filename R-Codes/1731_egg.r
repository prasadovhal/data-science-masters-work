egg <- function(N)
{
	e <- rexp(N,rate=1)
	g <- rexp(2*N,rate=2)
	f <- runif(3*N)
	f1 <-f[1:N]
	f2 <-f[(N+1):(3*N)]

	par(mar = c(5,4,4,4) + 0.3)
	plot(f1,e,col="red",xlab="f",ylab="e",pch="e")
	par(new=T)
	plot(f2,g,axes=F,col="green",xlab="f",ylab="",pch="g")
	axis(side=4)
	mtext("g",side=4,line=3)
}
