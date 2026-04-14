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
stocastic <- function(a)											
{
	iter = 0
	x = data[,-ncol(data)]
	x0 = rep(1,nrow(x))
	x = cbind(x0,x)
	y =	data[,ncol(data)]													
	m = nrow(x)
	#initial guess
	t = rep(0,ncol(x))
	j0 = j(t,x,y) 
	while(T)												
	{
		for(i in 1:ncol(x))
		{
			t[i] = t[i] - (a/m) * (sum((hx(t,x) - y) * x[,i]))		
		}
		
		j1 = j(t,x,y)
		err = abs(j0 - j1)
		print(err)
		i = i + 1
		if(err < 1.0e-2)								
			break
		else
			j0 = j1
		print(iter)
	}
	print(t)																				
}

#stochastic gradient descent
#1.45226630  1.49868391 -0.62217644  0.13725169 -0.93297708  1.47393555
#7.53275054 -1.47400066  1.85181109 -0.44039477  0.26208048 -0.02241997
#0.81469154 -2.46263359

