holey<-function(t)
{
u=m+1
v=matrix(0,1,u)

  ii=1
    while(t>0)
	{
	 v[ii]=t%%2
	 t=floor(t/2)
	 ii=ii+1
	}
   v=replace(v, which(v==0), -1)
   print(rev(v))
  
}
 
 	m=as.integer(readline(prompt="enter m:"))
 	n=2^(m+1)-1
 for(i in 0:n)
 {
 	x=holey(i)
	y=rev(x)
 	print(y)

	p=matrix(0,m,m)
	for(i in 1:m)
	{
	  if (i==1)
	  {
	    for (j in 1:m)
	     {
	      p[i,j]=-y[j+1]/y[1]
	     }
	 }
	else
	    for (j in 1:m)
	    {
	     if ((i-j)==1)
	     {
	      p[i,j]=1
	     }
	     else
	     {
	      p[i,j]=0
	     }
	   }
       }
	print(p)
	print(eigen(p,only.values=TRUE))
	k=eigen(p)
	k=k$values
	print(k)
	plot.new()
	plot(0,0,xlim=c(2,-2),ylim=c(2,-2))
	points(k,type='p',col=topo.colors(15),pch='*',cex=1)
	par(new=T)
}	
	rad=2
	alph=seq(0,2*pi,length=120)
	lines(rad*cos(alph), rad*sin(alph))
