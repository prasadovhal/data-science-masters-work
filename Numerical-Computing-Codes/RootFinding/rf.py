import numpy as np
import math as m

def p(x):
	#p = x**3 - 8 * x**2 + 20 * x -16
	#p = 3 * x -m.cos(x) -1
	#p = x**3 - 7 * m.exp(-x) + 2
	p = x**4 - x - 4
	return p

def rf(a,b,n):
	#p = np.poly1d([1,-1,0,-2])
	j = 0

	for i in range(n):
		x1 = (a * p(b) - b * p(a)) / float(p(b) - p(a))
		if(np.sign(p(a)) == np.sign(p(x1))):
			a = x1
		else:
			b = x1
		if(abs(p(x1)) < 1.0e-6):
			break
		j += 1
		print x1,j
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "
