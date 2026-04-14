library(ggplot2)
deci2bin= function(n) # convert decimal to binary
{
 i=1
 quo=1
 rem=0
 while(quo!=0)
 {
  quo=as.integer(n/2)
  rem[i]=n%%2

  rem[i]
  #print(rem[i])
  n=quo
  i=i+1
 }
#print(i)
 
 return(rem)
}

deg=as.integer(readline(prompt = "ENter the degree of polynomial: "))
Tot_comb=2^(deg+1) # total combinations of 1 and -1
Tot_coeff=Tot_comb*(deg+1)

for (i in 0:(Tot_comb-1)){
x=deci2bin(i)
#print(x)
plot(0,0,type="n",axes=FALSE)
#p=qplot()

colfunc <- colorRampPalette(c("orange", "black","blue"))

#plot(rep(1,10),col=colfunc(10),pch=19,cex=0.5,bty="n",axes=FALSE)
for (j in 1: (deg))
{

if (is.na(x[j+1])==TRUE)
{
x[j+1]=0
}

}

xx=replace(x, which(x==0),-1)
print(xx)
print(polyroot(xx))
print(which(is.complex(polyroot(xx))==FALSE))

complex_plot= points(polyroot(xx),cex=0.1,col=colfunc(deg+1))
#p=p+qplot(Re(polyroot(xx)), Im(polyroot(xx)),geom="line")
par(new=TRUE)
}

#add horizontal line circle and others #use plot.wondow
# do by matrix


#x=Allnumbers(Tot_comb)

#coeff1=1
#coeff2=-1
