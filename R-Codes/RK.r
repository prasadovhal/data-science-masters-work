f <- function(x,y)
{
  f <- x*x * y*y*y
}

RK2 <- function(x_last)
{
	x_old = 0
	y_old = 1
	h = 0.01
	
	for (x_old in seq(0,(x_last-h),by = h))
	{
		k1 = h * f(x_old,y_old)
		k2 = h * f((x_old + h),(y_old + k1))
		y_new = y_old + (k1 + k2)/2
		x_old = x_old + h
		#print(x_old)
		y_old = y_new
		#print(y_old)
		x_old = x_old +h
		plot(x_old,y_old,xlim=c(0,1),ylim=c(1,1.8),xlab = "X",ylab="Y",main="RK-2 , X vs Y")
		par(new=T) 
	}
	print(x_old)
	print(y_old)
}

RK3 <- function(x_last)
{
	x_old = 0
	y_old = 1
	h = 0.01
	
	for (x_old in seq(0,(x_last-h),by = h))
	{
		k1 = h * f(x_old,y_old)
		k2 = h * f((x_old + (h/2)),(y_old + (k1/2)))
		k3 = h * f((x_old + h),(y_old - k1 + 2 * k2))
		y_new = y_old + (k1 + 4* k2 + k3)/6
		x_old = x_old + h
		#print(x_old)
		y_old = y_new
		#print(y_old) 
		x_old = x_old +h
		plot(x_old,y_old,xlim=c(0,1),ylim=c(1,1.8),xlab = "X",ylab="Y",main="RK-3 , X vs Y")
		par(new=T)
	}
	print(x_old)
	print(y_old)
}


RK4 <- function(x_last)
{
	x_old = 0
	y_old = 1
	h = 0.01
	
	for (x_old in seq(0,(x_last-h),by = h))
	{
		k1 = h * f(x_old,y_old)
		k2 = h * f((x_old + (h/2)),(y_old + (k1/2)))
		k3 = h * f((x_old + (h/2)),(y_old + (k2/2)))
		k4 = h * f((x_old + h),(y_old + k3))
		y_new = y_old + (k1 + 2 * k2 + 2* k3 + k4)/6
		x_old = x_old + h
		#print(x_old)
		y_old = y_new
		#print(y_old) 
		x_old = x_old +h
		plot(x_old,y_old,xlim=c(0,1),ylim=c(1,1.8),xlab = "X",ylab="Y",main="RK-4 , X vs Y")
		par(new=T)
	}
	print(x_old)
	print(y_old)
}

