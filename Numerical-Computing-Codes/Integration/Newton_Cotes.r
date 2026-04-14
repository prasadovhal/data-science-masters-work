f <- function(x){1/(1+x^2)}

a = -10
b = 10
n = c(2,3,4,5,7,9,17,49,97,193,385)

h = (b-a)/(n[11]-1)
x = seq(a,b,by = h)
fx = f(x)

Trapezoidal <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)-1))
	{
		Sum1 = Sum1 + h * (f(x[i]) + f(x[i+1])) / 2
	}
	#print(Sum1)
	return(Sum1)
}

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

NewtonCotes5Point <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)))
	{
		if(i == 1 || (i == (length(x))))
			term = 7 * fx[i]
		else if(i%%2 == 0) 
			term = 32 * fx[i]
		else if(i%%4 == 1)
			term = 14 * fx[i]
		else
			term = 12 * fx[i]
			
		Sum1 = Sum1 + term
	}
	Sum1 = 2 * h * Sum1 / 45
	return(Sum1)
}

NewtonCotes7Point <- function()
{
	Sum1 = Sum2 = Sum3 = Sum4 = Sum5 = Sum6  = 0
	i = 1
	len = length(x)-2
	Sum7 = fx[1] + fx[length(x)]
	while(len > 0)
	{
		if((6*i+1) > len)
			break
		else
		{
			Sum1 = Sum1 + fx[6*i-4]
			Sum2 = Sum2 + fx[6*i-3]
			Sum3 = Sum3 + fx[6*i-2]
			Sum4 = Sum4 + fx[6*i-1]
			Sum5 = Sum5 + fx[6*i]
			Sum6 = Sum6 + fx[6*i+1]
			i = i + 1
			len = len - 1
		}
	}
	SumFinal = h*(41 * Sum7 + 216 * Sum1 + 27 * Sum2 + 272*Sum3 + 27 * Sum4 + 216 *Sum5 + 82 * Sum6)/140
	return(SumFinal)
}
cat("by Trapezoidal method ,result is",Trapezoidal(),"\n")
cat("by Simpsons one third method ,result is",simpsonsOneThrid(),"\n")
cat("by Simpsons three eight method ,result is",simpsonsThreeEight(),"\n")
cat("Newton Cotes 5 point integration answer is",NewtonCotes5Point(),"\n")
cat("Newton Cotes 7 point integration answer is",NewtonCotes7Point(),"\n")
I = integrate(f,a,b)
cat("Actual answer is",I$value,"\n")
