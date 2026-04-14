quadmap <- function(start,rho,niter)
{
	xVec <- rep(NA,niter)
	xVec[1] <- start
	for(i in 1:(niter-1))
	{
	 xVec[i+1] <- rho * xVec[i] * (1 - xVec[i])
	}
	xVec
}




quad2 <- function(start,rho,eps=0.02)
{
	x1 <- start
	x2 <- rho * x1 *(1 - x1) 
	niter <- 1
	while(abs(x1-x2) >= eps)
	{
	 x1 <- x2
	 x2 <- rho * x1 *(1 - x1)
	 niter <- niter +1
	 }
	 niter
}




tmpAcf <- function(xVec)
{
	xc <- xVec - mean(xVec)
	denom <- sum(xc^2)
	n <- length(xVec)
	r1 <- sum( xc[2:n] * xc[1:(n-1)])/denom
	r2 <- sum( xc[3:n] * xc[1:(n-2)])/denom
	list(r1 = r1 , r2 = r2)
}





tmpAcf1 <- function(xVec,k)
{
	xc <- xVec - mean(xVec)
	denom <- sum(xc^2)
	n <- length(xVec)
	tmpFn <- function(j)
	 {
	  sum(xc[(j+1):n] * xc[1:(n-j)])/denom
	 }
	 c(1,sapply(1:k,tmpFn))
}
