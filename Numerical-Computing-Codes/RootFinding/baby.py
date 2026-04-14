import numpy as np
import math as m

def baby(n,x0,pw):
	#equation of type x**pw - n = 0 
	i = 0
	while(True):
		x = ((pw-1)*x0 + (n / float(x0**(pw-1)))) / float(pw)
		i += 1
		if(abs(x - x0) < 1.0e-10):
			break
		else:
			x0 = x
		print x,i
