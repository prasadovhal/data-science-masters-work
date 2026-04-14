import numpy as np
import matplotlib.pyplot as plt
import pylab as pl

def prime(k):
	if(k < 20):
		k = 20
	prime =[2]
	for j in range(1,k+1):
		kk = int(np.ceil(np.sqrt(j)))
		v = []
		for i in range(2,kk+1):
			rem = j % i
			v.append(rem)
		if 0 in v:
			#print "Number is not prime"
			vv = 1
		else:
			#print "Number is  prime"
			prime.append(j)
	print prime
	
	plt.hist(range(1,k+1),cumulative = True,color = 'r',log = True)
	plt.hist(prime,cumulative = True,color = 'y',log = True)
	pl.title("Density of Natural Number vs Prime Number")
	plt.show()
