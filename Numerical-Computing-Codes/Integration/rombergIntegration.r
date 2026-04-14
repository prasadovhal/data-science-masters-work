f <- function(x)
{
	I = 1 / (1+x^2)
	return(I)
}

a = -10
b = 10
h1 = 0.5
rho = 0.5
gamma = 2 
h = c(h1)

for(i in 2:7)
{
	h[i] = h[i-1] * rho
}

n = (b-a)/h

T0 = c()
for(i in 1:length(h))
{
	x = seq(a,b,by=h[i])
	fx = f(x)
	Sum1 = 0
	for(j in 1:(length(x)-1))
	{
		Sum1 = Sum1 + h[i] * (fx[j] + fx[j+1]) / 2
	}
	T0[i] = Sum1
}

Tlist = list()
Tlist[[1]] = T0
for(m in 2:length(h))
{
	Tm = c()
	for(i in 2:(length(T0)))
	{
		Tm[i-1] = T0[i] + (T0[i] - T0[i-1])/((rho^(-(m)*gamma)) - 1)
	}
	Tlist[[m]] = Tm
	T0 = Tlist[[m]]
}

cat("by Romberg's method integration value at m=",m,"and ","h=",h[length(h)],"is",Tlist[[m]][1],"\n")
I = integrate(f,a,b)
cat("Actual answer is",I$value,"\n")
