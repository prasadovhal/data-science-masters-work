import numpy as np
import math as m

pol = []
n = input("enter order of polynomial:\n")

print "enter coeff.form higher degree and each time press enter:"
for i in range(n+1):
	a = input("")
	pol.append(a)
	
arr = []
x0 = 0
a = 0
p = np.poly1d(pol)
while(True):	
	de_p = p.deriv()
	j = 0
	while(True):
		x1 = x0 - (p(x0) / float(de_p(x0)))
		if(np.fabs(x1-x0) < 1.0e-6):
			break
		x0 = x1
		j += 1
		if(j >=20):
			print"roots might be imaginary newton raphson can not find imaginary roots"
			break
		#print x1

	if(j >= 20):
		arr.append(p)
		break
	else:
		x1 = round(x1,2)
		part1 = np.poly1d([1,-x1])

		arr.append(part1)
		a += 1
		if(a >= n):
			break
		part2 = (p / part1)[0]
		p = part2
		x0 = 0

	
print arr	
	
