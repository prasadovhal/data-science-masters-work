#after sourcing file value of enter degree m, and after first plot enter egg(50)# 

#------------------------------Q1.egg-------------------------#
egg <- function(N)
{
	e <- rexp(N,rate=1)
	g <- rexp(2*N,rate=2)
	f <- runif(3*N)
	f1 <-f[1:N]
	f2 <-f[(N+1):(3*N)]

	par(mar = c(5,4,4,4) + 0.3)
	plot(f1,e,col="red",xlab="f",ylab="e",pch="e")
	par(new=T)
	plot(f2,g,axes=F,col="green",xlab="f",ylab="",pch="g")
	axis(side=4)
	mtext("g",side=4,line=3)
}




#------------------------------Q2.holey-------------------------#

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
 
 	m=as.integer(readline(prompt="enter degree m:"))
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
