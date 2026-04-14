tmp <- diag(2, nr = 5)
tmp[abs(row(tmp) - col(tmp)) == 1] <- 1
tmp
tmpFn <- function(n, k)
{
tmp <- diag(k, nr = n)
tmp[abs(row(tmp) - col(tmp)) == 1] <- 1
tmp
}
