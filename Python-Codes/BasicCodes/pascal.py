import numpy as np
import math as m

def fact(n):
	if (n==0):
		return 1
	else:
		return n*fact(n-1)

def pascal(n):
	for i in range(n):
		a = np.array([])
		for j in range(i+1):
			b = fact(i) / (fact(i-j) * fact(j))
			a = np.append(a,b)
		print a
