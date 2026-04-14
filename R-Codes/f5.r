tmpFn <- function(mat)
{
mat[mat%%2 == 1] <- 2 * mat[mat%%2 == 1]
mat
}
