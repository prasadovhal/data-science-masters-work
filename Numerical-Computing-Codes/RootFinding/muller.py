import numpy as np
import math as m

def p(x):
	#p = x**3 - 8 * x**2 + 20 * x -16
	p = 3 * x -m.cos(x) -1
	#p = x**3 - 7 * m.exp(-x) + 2
	#p = x**4 - x - 4
	return p

def muller(x0,x1,x2,n):
	#p = np.poly1d([1,0,-6,-1])
	j = 0
	for i in range(n):
		e0 = (p(x0) - p(x2)) / float(x0 - x2)
		e1 = (p(x1) - p(x2)) / float(x1 - x2)
		A0 = (e0 - e1) / (x0 - x1)
		A1 = (((x1 - x2) * e0) - ((x0 - x2) * e1)) / float(x1 - x0)
		A2 = p(x2)
		if(A1 > 0):
			x3 = x2 - ((2.0 * A2) / (A1 + m.sqrt(A1**2 - 4 * A0 *A2)))
		else:
			x3 = x2 - ((2.0 * A2) / (A1 - m.sqrt(A1**2 - 4 * A0 *A2)))
		
		x0 = x1
		x1 = x2
		x2 = x3
		j += 1
		if(abs(p(x3)) < 1.0e-6):
			break
		print x3,j
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "
