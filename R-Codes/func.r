xVec <- sample(0:900 , 250 , replace=T)
tmpFn1 <- function(xVec)
{
 xVec^(1:length(xVec))
}
 tmpFn2 <- function(xVec)
{
 n <- length(xVec)
(xVec^(1:n))/(1:n)
}
