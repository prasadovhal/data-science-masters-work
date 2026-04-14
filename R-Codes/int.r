int1 <- function(x)
{
	int1 = 1-x
	I = integrate(int1,0,1) 
}

int2 <- function(x)
{	
	int2 = sqrt(1 - x^2)
	I = integrate(int2,0,1)$val
}

main <- function(n)
{
	
	x <- runif(n)
	I.hat = 0
	for(i in 1:n)
	{
		I.hat = I.hat + (int1(x[i]))$val
		i = i + 1
	}
	In.hat = I.hat /n
	print(In.hat)
}
