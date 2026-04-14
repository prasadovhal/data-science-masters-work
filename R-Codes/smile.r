circle <- function(radius,center)
{
	theta <- seq(0,360,by=0.01)
	x <- radius * cos(theta) + center[1]
	y <- radius * sin(theta) + center[2]
	plot(x,y,xlim=c(-2,2),ylim=c(-2,2),xlab='',ylab='',pch='.')
	par(new=T)
}

ellipse <- function(a,b,center)
{
	theta <- seq(0,360,by=0.01)
	x <- a * cos(theta) + center[1]
	y <- b * sin(theta) + center[2]
	plot(x,y,xlim=c(-2,2),ylim=c(-2,2),xlab='',ylab='',pch='.')
	par(new=T)
}

triangle <- function(x1,y1,x2,y2,x3,y3)
{
	X <- c(x1,x2,x3,x1)
	Y <- c(y1,y2,y3,y1)
	plot(X,Y,xlim=c(-2,2),ylim=c(-2,2),"l",lwd=1,xlab='',ylab='')
}

main <- function()
{
	circle(2,c(0,0))
	circle(0.1,c(-0.8,0.5))
	circle(0.5,c(-0.8,0.5))
	circle(0.1,c(0.8,0.5))
	circle(0.5,c(0.8,0.5))
	ellipse(1,0.1,c(0,-1))
	triangle(0,0,-0.5,-0.5,0.5,-0.5)
}
