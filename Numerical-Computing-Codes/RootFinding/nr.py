import numpy as np

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

def nr(x0,n):
	#p = np.poly1d([1,0,0-8])
	#dp = np.polyder(p)
	j = 0
	for i in range(n):
		x1 = x0 - (p(x0) / float(dp(x0)))
		if(abs(p(x1)) < 1.0e-6):
			break
		x0 = x1
		j += 1
		print x1,j,p(x1)
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "	
