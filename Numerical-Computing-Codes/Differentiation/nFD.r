f <- function(x)
{
	return(x^2 + exp(x))
}

x = seq(3,18,by=3)#c(0,0.5,1,2)
fx = c(11,27,55,87,96,110)#f(x)

newf = fx
fD = list()

#fD[[1]] = fx
j = 1

while(j <= (length(fx)-1))
{
	diff = 0
	for(i in 1:(length(newf)-1))
	{
		diff[i] = (newf[i+1] - newf[i])/(x[i+j] - x[i])
	}

	fD[[j]] = diff
	newf = diff
	j = j + 1
}

xnew = 7
fnew = fx[1]
mul = 1

for(i in 1:(length(fD)))
{
	mul = mul * (xnew - x[i])
	#print(mul)
	fnew = fnew + mul * fD[[i]][1]
	#print(fnew)
}
cat("function value at",xnew,"is",fnew,"\n\n")
cat("actual function value at",xnew,"is",f(xnew),"\n\n")
#################################################################################################
## f'(x) using difference formulae

h = x[2] - x[1]

#forward diiference
#f_dash_fw = (f(xnew+h) - f(xnew)) / h
#cat("by forward difference,function derivative value at",xnew,"is",f_dash_fw,"\n\n")

#backward difference
#f_dash_bw = (f(xnew) - f(xnew-h)) / h
#cat("by backward difference,function derivative value at",xnew,"is",f_dash_bw,"\n\n")

#central difference
#f_dash_cn = (f(xnew+h) - f(xnew-h)) / (2*h)
#cat("by central difference,function derivative value at",xnew,"is",f_dash_cn,"\n\n")

#################################################################################################
### by Newton - Gregory Method

#x[length(x)+1] = xnew
#fx[length(x)] = fnew
newf = fx

NGT = list()

#fD[[1]] = fx
j = 1

##Newton-Gregory table
while(j <= (length(fx)-1))
{
	diff = 0
	for(i in 1:(length(newf)-1))
	{
		diff[i] = (newf[i+1] - newf[i])
	}

	NGT[[j]] = diff
	newf = diff
	j = j + 1
}

#
f_dash = NGT[[1]][1]
for(i in 2:length(NGT))
{
	f_dash = f_dash + (-1)^(i-1)*NGT[[i]][1]/(i)
}
#f_dash = f_dash
cat("by Newton - Gregory Method,function derivative value at",xnew,"is",f_dash,"\n\n")
#x = xnew
#cat("Actual function derivative value at",x,"is",eval(D(expression(x^2+exp(x)),"x")),"\n\n")
