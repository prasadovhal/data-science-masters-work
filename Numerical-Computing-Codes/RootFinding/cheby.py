import numpy as np
import math as m

def p(x):
	#p = x**3 - 8 * x**2 + 20 * x -16
	p = 3 * x -m.cos(x) -1
	#p = x**3 - 7 * m.exp(-x) + 2
	#p = x**4 - x - 4
	return p
	
def dp(x):
	#dp = 3 * x**2 -16 * x + 20 
	dp = 3 + m.sin(x)
	#dp = 3 * x**2 + 7 * m.exp(-x) 
	#dp = 4 * x**3 -1
	return dp
	
def ddp(x):
	#ddp = 6 * x - 16
	ddp = m.cos(x)
	#ddp = 6 * x - 7 * m.exp(-x) 
	#ddp = 12 * x**2

def cheby(x0,n):
	#p = np.poly1d([1,0,-1,-1])
	#dp = np.polyder(p)
	#ddp = np.polyder(dp)
	j = 0

	for i in range(n):	
		x1 = x0 - (p(x0) / float(dp(x0))) - ((p(x0)**2 * (ddp(x0)) / float(2.0 * dp(x0)**3)))
		if(abs(p(x1)) < 1.0e-6):
			break
		x0 = x1
		j += 1
		print x1,j
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "
