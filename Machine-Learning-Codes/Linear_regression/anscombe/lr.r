data = anscombe
#hypothesis function
hx <- function(t0,t1,x)
{
	h = t0 + t1 * x
}

#cost function
j <- function(t0,t1,x,y)
{
	J = sum((hx(t0,t1,x) - y)^2) / (2 * length(x))
}

main <- function(a)											#main function
{
	i = t0 = t1 = 0											#initialize values of theta0 and theta1 
	x = data$x1												#input attribute
	y =	data$y1												#actual y or output
	m = length(x)
	j0 = j(t0,t1,x,y)										#cost function at start
	
	while(T)												#update the best values of theta
	{
		i = i + 1
		tmp0 = t0 - (a/m) * (sum((hx(t0,t1,x) - y)))		#new theta0 using greadient descent
		tmp1 = t1 - (a/m) * (sum((hx(t0,t1,x) - y) * x))	#new theta1 using greadient descent
		t0 = tmp0											#batch update of theta0 and theta1
		t1 = tmp1
		j1 = j(t0,t1,x,y)									#new cost function
		err = abs(j0 - j1)									#error between cost function
		j0 = j1
		#print(err,t0,t1)
		if(err < 1.0e-10)									#convergence condtion
			break	
	}
	print(t0)												#best value of theta0
	print(t1)												#best value of theta1
}
