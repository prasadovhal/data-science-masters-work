import numpy as np

class fibonacchi():
	def __init__(self):
		self.arr = np.array([])

	def fiboSeriesGen(self,n):
		t0 = 0
		t1= 1
		i = 0
		self.arr = np.append(self.arr,[t0,t1])
		while(i <= (n-3)):
			t = t0 + t1
			t0 = t1
			t1 = t
			i += 1
			self.arr = np.append(self.arr,t)
		return self.arr

class UserInterface():
	def __init__(self):
		self.max = 0
	
	def getn(self):
		self.n = input("enter number of terms: ")
	
	def pre(self):
		self.n = self.getn()
		if(self.n < 20):
			self.n = 20
		F = fibonacchi()
		print(F.fiboSeriesGen(self.n))

U = UserInterface()
U.pre()
