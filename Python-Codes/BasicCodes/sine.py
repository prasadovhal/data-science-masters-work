import math

def sine(x):
	summ = mul = x
	for i in range(3,50,2):
		mul = mul * ((-x**2)/float(i*(i-1)))
		summ = summ + mul
	print(math.sin(x))
	return summ
	

def sin(x):
	if x == 1:
		return x
	else :
		mul = x
		ran = range(3,25,2)
		mul = mul * ((-x**2)/float(i*(i-1)))
		
		return 
