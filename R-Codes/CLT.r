# An illustration of the central limit theorem

N <- c( 2, 5, 10^c( 1:4 ) ) # sample sizes
m <- 1000                   # number of repetitions for each sample size

# pdf( file = 'clt.pdf', onefile = T, width = 11.7, height = 8.3, paper = 'a4r' )
 op <- par( mfcol = c( 2, 6 ) ) # set the display matrix, saving current graphics settings
  for ( n in N ) # loop over sample sizes
   {
    # a sample of m average values
    xbar <- replicate( m, mean( rexp( n ) ) ) # try changing the distribution in the RHS
    # xbar <- sapply( 1:m, function( i ) { mean( rexp( n ) ) } ) # equivalent code

    # histogram of xbar
    hist( xbar, breaks = min( nclass.FD( xbar ), 50 ), freq = FALSE, col = 'gray30', border = 'white', xlab = expression( bar(X)[n] ), main = paste( 'N =', n ) )
    rug( xbar )

    # normal density with same mean and sd as xbar
    x <- seq( min( xbar ), max( xbar ), length = 101 )
    lines( x, dnorm( x, mean = mean( xbar ), sd = sd( xbar ) ), col = 'red' )

    qqnorm( xbar ); qqline( xbar, col = 'red' ) # QQ plot against the standard normal
   }
 par( op ) # restore original graphics settings
# dev.off() # close the graphics device

