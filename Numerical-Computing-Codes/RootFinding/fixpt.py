import numpy as np
import math as m

def p(x):
	p = x**3 - 3 * x**2 + 4 * x - 1
	return p

def g(x):
	g = (-x**3 - 3 * x**2 + 1) / 4.0
	return g

def dg(x):
	dg = (6 * x - 6) / 4.0

def fixpt(x0):
	#p = np.poly1d([1,0,-5,-10])
	#g = (np.poly1d([5,10]))**(float(1/3))
	i = 0
	while(True):
		x1 = g(x0)
		if(abs(x0-x1) < 1.0e-12):
			break
		else:
			x0 = x1
		i += 1
		print x1,i
	print p(x1)
	
	#print np.roots(p(x))
