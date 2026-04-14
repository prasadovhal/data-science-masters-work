xfun <- function(x)
{
	n <- length(x)
	for(i in 3:n)
	 {
	   k <-(( x[i-2] + x[i-1] + x[i] ) / 3)
	   print(k)
	 }

}



quadrant <- function(alpha)
{
	if (alpha<90)
	  print("first q")
}


tmpFn <- function(mat)
{
	mat <- 2 * mat[mat%%2 == 1]
	mat
}
