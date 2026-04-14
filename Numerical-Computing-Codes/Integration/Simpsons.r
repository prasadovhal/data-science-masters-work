f <- function(x){sin(x)}

a = 0
b = pi
n = c(3,4,11, 23, 31, 43, 53, 128, 256,512,1024,1800)

h = (b-a)/(n[12]-1)
x = seq(a,b,by = h)
fx = f(x)

simpsonsOneThrid <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)))
	{
		if(i == 1 || (i == (length(x))))
			term = fx[i]
		else if(i%%2 == 1)
			term = 4 * (fx[i])
		else
			term = 2 * (fx[i])
			
		Sum1 = Sum1 + term
	}
	Sum1 = h * Sum1 / 3
	return(Sum1)
}

simpsonsThreeEight <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)))
	{
		if(i == 1 || (i == (length(x))))
			term = fx[i]
		else if(i%%3 == 0)
			term = 2 * (fx[i])
		else
			term = 3 * (fx[i])
			
		Sum1 = Sum1 + term
	}
	Sum1 = 3*h * Sum1 / 8
	return(Sum1)
}


cat("by Simpsons one third method ,result is",simpsonsOneThrid(),"\n")
cat("by Simpsons three eight method ,result is",simpsonsThreeEight(),"\n")

I = integrate(f,a,b)
cat("Actual answer is",I$value,"\n")
