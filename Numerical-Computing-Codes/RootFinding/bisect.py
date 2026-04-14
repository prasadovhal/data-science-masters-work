import numpy as np
import math as m

def p(x):
	#p = x**3 - 8 * x**2 + 20 * x -16
	p = 3 * x -m.cos(x) -1
	#p = x**3 - 7 * m.exp(-x) + 2
	#p = x**4 - x - 4
	return p

def bisec(a,b,n):
	#p = np.poly1d([1,0,0,-8])
	c = (a + b) / 2.0
	j = 0
	k = (abs(m.log(b-a)) - m.log(1.0e-10)) / m.log(2)
	print k
	
	for i in range(n):
		if(np.sign(p(a)) == np.sign(p(c))):
			a = c
		else:
			b = c
		c = (a + b) /2.0
		if(abs(p(x1)) < 1.0e-6):
			break	
		j += 1
		print c,p(c),j
	if(abs(p(x1)) > 1.0e-6):	
		print "number of iterrations not sufficient for tolerance "
	 
