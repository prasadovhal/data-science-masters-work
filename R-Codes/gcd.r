gcd <- function(a,b)
{
	if(a > b)
	{
	  a = a
	  b = b
	}
	else if(a < b)
	{
	 temp = a
	 a = b
	 b = temp 
	}
	rem = a%%b
	i = 0
	
	while (rem !=0)
	{
	 a = b
	 b = rem
	 i = i+1
	}
print(rem)
}
