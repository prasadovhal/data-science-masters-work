import numpy as np


class magS:
	def __init__(self):
		self.n = 2
		self.mag_sq = np.zeros((self.n,self.n),dtype = int)
		
	def Magic(self):
		self.n = int(input('Size of squar :'))
		self.mag_sq = np.zeros((self.n,self.n),dtype = int)
		i , j = 0, self.n // 2
		N = 1
		while(N <= self.n ** 2):
			self.mag_sq[i,j] = N
			N += 1
			newi , newj = (i - 1) % self.n , (j + 1) % self.n
			if(self.mag_sq[newi , newj]):
				i += 1
			else:
				i , j = newi , newj
		print(self.mag_sq)
		
a = magS()
a.Magic()
