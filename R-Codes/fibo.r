fibo <- function(n)
{
	f0 = 0
	f1 = 1
	#print(f0)
	#print(f1)
	fn=0
	phi=0
	err=0
	phi_exact = ((1+sqrt(5))/2)
	for(i in 1:(n-1))
	{
	  fn[i] = f0 + f1
	  #print("fn")
	  f0 = f1
	  f1 = fn[i]
	  phi[i] = f1 / f0
	  #print("phi")
	  #print(phi)
	 err[i] = abs((phi[i] - phi_exact) / phi_exact)
	}
	f0 = 0
	f1 = 1
	print(c(f0,f1,fn))
	print(phi)
	plot((1:(n-1)),phi,"b",xlab='n',ylab='phi',ylim=c(1,2),bty='n')
	par(new=T)
	
	c <- rep(1,n-1)
	plot((1:(n-1)),(phi_exact*c),"l",xlab='',ylab='',axes=F,ylim=c(1,2),lty=2,col='red',bty='n')
	
	
	x11()
	plot((1:(n-1)),err,"b",xlab='n',ylab='relative error',xlim=c(10,n+1), ylim = c(0.000000001, 0.00001),bty='n')

}
