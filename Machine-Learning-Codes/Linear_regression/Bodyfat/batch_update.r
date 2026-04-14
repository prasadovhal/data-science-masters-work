library(plyr)
library(tibble)
library(corpcor)

data = read.csv("Bodyfat.csv")[,-2]
bodyfat = read.csv("Bodyfat.csv")[,2]

data = cbind(data,bodyfat)[,-1]
#feature scale
for(i in 1:(ncol(data)-1))
{
	data[,i] = abs((data[,i] - mean(data[,i]))/(sd(data[,i]))) 
}

hx <- function(t,x)
{
	h = 0
	for(j in 1:nrow(x))
	{
		hi = 0
		for(i in 1:ncol(x))
		{
			hi[i] = (t[i] * x[j,i])
		}
		h[j] = sum(hi)	
	}
	h = h
}

#cost function
j <- function(t,x,y)
{
	J = sum((hx(t,x) - y)^2) / (2 * nrow(x))
}

#learning rate  
#a = 0.1
#function for gradient descent method 
batch <- function(a)											
{
	#initial guess
	iter = 0
	x = data[,-ncol(data)]
	x0 = rep(1,nrow(x))
	x = cbind(x0,x)
	y =	data[,ncol(data)]													
	m = nrow(x)
	t = tmp = rep(0,ncol(x))
	j0 = j(t,x,y) 
	#batch update of theta's	
	while(T)												
	{
		for(i in 1:ncol(x))
		{
			tmp[i] = t[i] - (a/m) * (sum((hx(t,x) - y) * x[,i]))		
		}
		
		t = tmp
		j1 = j(t,x,y)
		err = abs(j0 - j1)
		print(err)
		iter = iter + 1
		if(err < 1.0e-3)								
			break
		else
			j0 = j1
		print(iter)
	}
	print(t)																				
}


#for a = 0.01 and accuracy of 10^-4
#6.5037615   9.6035737   3.0395882  -4.6340000  -2.6172564  12.5660126
#25.0401323   6.2593743   8.2067399   0.5042423  -1.7359017   1.9545347
#2.8198486 -11.8355819

