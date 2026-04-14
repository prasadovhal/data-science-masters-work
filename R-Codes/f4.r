tmpFn4 <- function(x)
{
 if ( x < 0 )
   {
    a <- ((x * x) + (2 * x) + 3)
    print(a)
   }
 else
  if ( x <= 2 )
   {
    a <- x + 3
    print(a)
   }
 else
  if (x >= 2)
   {
    a <- ((x * x) + (4 * x) -7)
    print (a)
   }
}

tmp <- seq(-3, 3, len=100)
plot(tmp, tmpFn(tmp), type="l")
