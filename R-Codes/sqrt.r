baby <-function(S)
{
x_old = 1
e = 0.00001
x_new =(x_old +(S/x_old))/2
i=0
  while(abs(x_new-x_old) > 0)
  {
  	x_old = x_new
	x_new =(x_old +(S/x_old))/2
	print(x_new)
	i=i+1
	plot(x_new,)
	par(new=T)
  }  
}

indian <-function(S)
{
x_old = 1
a_new = (S - (x_old)^2) / (2*x_old)
x_new = x_old +a_new + ((a_new)^2/(x_old +a_new))
e = 0.00001
i=0
  while(abs(x_new-x_old) > e)
  {
  	x_old = x_new
	a_new = (S - (x_old)^2) / (2*x_old)
	x_new = x_old + a_new + ((a_new)^2/(x_old + a_new))
	print(x_new)
	i=i+1
  }   
}

