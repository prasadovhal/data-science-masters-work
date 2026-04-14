library(Deriv)

f <- function(x)
{
	f = exp(x)#(5*x*exp(-2*x))
	return(f)
}

h1 = 1
rho = 0.5
gamma = 2 #for Central Difference
x = 1.5
h = c(h1)

for(i in 2:6)
{
	h[i] = h[i-1] * rho
}
#print(h)

T0 = c()
for(i in 1:length(h))
{
	T0[i] = (f(x+h[i]) - f(x-h[i]))/(2*h[i])
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

cat("by Richardson's method derivative value at m=",m,"and ","h=",h[length(h)],"is",Tlist[[m]][1],"\n")
gg <- expression(exp(x))#expression(5*x*exp(-2*x))
cat("Actual derivative value at x =",x,"is",eval(Deriv(gg,"x")),"\n")
