import numpy as np
import math as m

def p(x):
	#p = x**3 - 8 * x**2 + 20 * x -16
	p = 3 * x -m.cos(x) -1
	#p = x**3 - 7 * m.exp(-x) + 2
	#p = x**4 - x - 4
	return p

def sacent(a,b,n):
	#p = np.poly1d([1,0,0,-1,-10])
	x = (a * p(b) - b * p(a)) / float (p(b) - p(a))
	j = 0
	
	for i in range(n):
		x1 = (a * p(b) - b * p(a)) / float (p(b) - p(a))
		if(x1 > b and x1 > a):
			a = b
			b = x1
		elif(x1 < a and x1 < b):
			b = a
			a = x
		elif(x1 > a and x1 < b):
			if(abs(a-x1) < abs(b-x1)):
				b = x1
			else:
				a = x1
		if(abs(p(x1)) < 1.0e-6):
			break
		j += 1
		print x,j
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "
