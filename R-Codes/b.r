ff <- function(n)
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
 return(rem)
 }
 
 
 
 deg=as.integer(readline(prompt = "ENter the degree of polynomial: "))
