library(plyr)
library(tibble)
library(corpcor)

x = read.csv("ex4x.dat",sep= "\t")
y = read.csv("ex4y.dat",sep= "\t")
x0 = rep(1,nrow(x))
x = as.data.frame(cbind(x0,x))

for(i in 2:(ncol(x)))
{
	x[,i] = abs((x[,i] - mean(x[,i]))/(sd(x[,i]))) 
}

a = 0.1
#batch <- function(a)											
{
	iter =  0
	m = nrow(x)
	t = rep(0,ncol(x))
	h = 0
	for(i in 1:nrow(x))
	{
		h[i] = 1 / (1 + exp(-sum(t * x[i,])))	
	}
	
	j0 = (1/nrow(x)) * sum((-y[,1]*log(h)) - (1-y[,1])*log(1-h)) 
	
	while(T)												
	{
		tmp0 = t[1] - (a/m) * (sum((h - y[,1]) * x[,1]))
		tmp1 = t[2] - (a/m) * (sum((h - y[,1]) * x[,2]))
		tmp2 = t[3] - (a/m) * (sum((h - y[,1]) * x[,3]))
		
		t = c(tmp0,tmp1,tmp2)
		print(t)
		
		for(j in 1:nrow(x))
		{
			h[j] = 1 / (1 + exp(-sum(t * x[j,])))	
		}
		
		j1 = (1/nrow(x)) * sum((-y[,1]*log(h)) - (1-y[,1])*log(1-h))  
		err = abs(j0 - j1)
		print(err)
		iter = iter + 1
		print(iter)
		if(err < 1.0e-7)								
			break
		else
			j0 = j1
	}
	#print(t)
}
