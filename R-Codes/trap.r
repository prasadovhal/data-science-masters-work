options(digits=16)

f <-function(x)
{
	f1 = exp(-x^2/2) / sqrt(2*pi)
}

main <- function()
{
	
	a = 1 
	b = 2
	h = 0 
	I = 0
	err = 0
	I_exact = integrate(f,1,2)$val
	print("I_exact")	
	print(I_exact)
	
	n = c(2,11,20,31,40,51)
	#print(n[1]) 
	for(k in 1:length(n))
	  {
	   h[k] = (b-a)/(n[k]-1)
	   x = 0
	  for(i in 1:n[k])
	   {
	    x[i] = a + (i-1)*h[k]
	   }
	   #print(x)
	   fx = 0
	  for(i in 1:n[k])
	   {
	    fx[i] = f(x[i])
	   }
	   #print(fx)
	 
	   #print(fx[1])
	   #print(fx[n])
	 
	   i1 = ( fx[1] + fx[n[k]])/2
	   #print(i1)
	   i2= 0 
	   for(i in 2:(n[k]-1))
	    {
	     i2 = i2 + fx[i]
	    }
	   #print(i2)
	 
	 I[k] = h[k] * (i1+i2)
	 
	 err [k] = (I[k] - I_exact) / I_exact
	 }
	 #print(I)
	 #print(err)
	 
	 print("Table")
	 table <- data.frame(n,I,err)
	 print(table)
	 print("============================thank you==========================")
}
