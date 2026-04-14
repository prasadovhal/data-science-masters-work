f <- function(x){sin(x)}

a = 0
b = pi
n = c(2, 4, 8, 16, 32, 64, 128, 256,512,1024,1800)

h = (b-a)/n[11]
x = seq(a,b,by = h)
fx = f(x)
#fx = f(x)

LeftSum <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)-1))
	{
		Sum1 = Sum1 + h * (f(x[i]))
	}
	#print(Sum1)
	return(Sum1)
}

RightSum <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)-1))
	{
		Sum1 = Sum1 + h * (f(x[i+1]))
	}
	#print(Sum1)
	return(Sum1)
}

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

MidPointSum <- function()
{
	Sum1 = 0
	for(i in 1:(length(x)-1))
	{
		Sum1 = Sum1 + h * (f(x[i] + x[i+1])) / 4
	}
	#print(Sum1)
	return(Sum1)
}

cat("by Left sum result is",LeftSum(),"\n")
cat("by right sum result is",RightSum(),"\n")
cat("by mid point sum result is",MidPointSum(),"\n")
cat("by trapezoidal ,result is",Trapezoidal(),"\n")
I = integrate(f,a,b)
cat("Actual answer is",I$value,"\n")
