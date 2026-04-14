# An illustration of the Law of Large Numbers
#
# X_1, ... X_n ~ Bernoulli(p)
# p.hat <- (1/n) sum_i X_i

p  <- exp( -1 ) # probability of a head
ln <- 0:6       # log10( sample sizes )
nr <- 1000      # number of replications

stopifnot( p >= 0, p <= 1, all( ln == as.integer( ln ) ), all( ln >= 0 ) )

# explicit loops
#
# t0.e <- Sys.time()
#  p.hat <- matrix( nrow = nr, ncol = length( ln ) )
#  for ( j in 1:length( ln ) )
#   {
#    n <- 10^ln[j]
#    for ( i in 1:nr ) p.hat[i,j] <- sum( sample( 0:1, n, replace = TRUE, prob = c( 1 - p, p ) ) ) / n
#   }
# t1.e <- Sys.time()
# print( t1.e - t0.e )

# implicit loops, version 1
#
# sometimes, replacing explicit loops using the "apply" family of functions such
# as sapply(), lapply(), replicate() can make the computation faster in R.
#
# t0.i1 <- Sys.time()
#  p.hat <- sapply( ln, function( k ) { n <- 10^k; sapply( 1:nr, function( i ) { sum( sample( 0:1, n, replace = TRUE, prob = c( 1 - p, p ) ) ) / n } ) } )
# t1.i1 <- Sys.time()
# print( t1.i1 - t0.i1 )

# implicit loops, version 2
#
# sometimes, replacing explicit loops using the "apply" family of functions such
# as sapply(), lapply(), replicate() can make the computation faster in R.
#
 t0.i2 <- Sys.time()
  p.hat <- sapply( ln, function( k ) { n <- 10^k; replicate( nr, sum( sample( 0:1, n, replace = TRUE, prob = c( 1 - p, p ) ) ) / n ) } )
 t1.i2 <- Sys.time()
 print( t1.i2 - t0.i2 )

# visualize as boxplots
#
 op <- par( bty = 'n' )
  boxplot( p.hat, axes = FALSE, ylim = c( 0, 1 ), xlab = 'n' )
  abline( h = p, col = 'red' )

  axis( 1, at = 1:length( ln ), labels = parse( text = paste( '10^', ln ) ) )
  axis( 2 )
  axis( 4, at = p, label = 'p', col.axis = 'red', las = 1 )
 
  title( main = 'Law of Large Numbers for Coin Tossing' )
  title( ylab = expression( widehat( p ) ), line = 2 )
 par( op )

