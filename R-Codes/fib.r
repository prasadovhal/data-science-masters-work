fib <- function(n)
{
	f_minus1=1
	f_minus2=1
	for(i in 2:n)
	{
	  result=f_minus1+f_minus2
	  f_minus2=f_minus1
	  f_minus1=result
	  print(result)
	}
}
