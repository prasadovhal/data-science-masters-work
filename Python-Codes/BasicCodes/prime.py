import numpy as np
import math as m
import matplotlib.pyplot as plt

class PrimeGen:
	def __init__(self):
		self.list = np.array([])
		
	def prime(self,n):
		if(n < 20):
			n = 20
		x = 3
		self.list = np.append(self.list,2)
		j = 0
		while((j+2) <= n):
			k = int(m.ceil(m.sqrt(x)))
			for i in range(2,k+1):
				b = x % i
				if(b == 0):
					s = 1
					break
				else:
					s = 0
			if(s == 0):
				self.list = np.append(self.list,x)
				j += 1
			x += 2
		print self.list
		plt.hist(self.list,bins = n/2)
		plt.show()
		
u = PrimeGen()
u.prime(21)
