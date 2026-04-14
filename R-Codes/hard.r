fun1 <- function(x,y)
{
	colSums( outer(y,x,"<"))
}

fun2 <- function(x,y)
{
	rowSums( sapply(y, FUN=function(y){y<x}))
}

fun3 <- function(x,y)
{
	rowSums( vapply(y, FUN=function(y){y<x},FUN.VALUE=seq(along=x)))
}

fun4 <- function(x,y)
{
	leny <- length(y)
	mat <- matrix(rep(x,leny),byr=T,nr=leny)
	apply(y<mat,2,sum)
}


r1 <-rnorm(10000)
r2 <-rnorm(12000)
system.time(fun1(r1,r2))
system.time(fun2(r1,r2))
system.time(fun3(r1,r2))
system.time(fun4(r1,r2))
