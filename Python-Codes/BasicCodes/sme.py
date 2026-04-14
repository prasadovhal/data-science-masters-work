import numpy as np
import math as m

def sse():
	A = input("enter coefficients of unknowns by comma seprated values:   ")
	b = input("enter values after = sign of equation by comma seprated values:   ")
	b = (np.mat(b)).T
	l = len(A)
	if(abs(m.sqrt(l)- int(m.sqrt(l))) < 1.0e-6):
		A = np.mat(np.reshape(A,(int(m.sqrt(l)),int(m.sqrt(l)))))
		print A
		print b
		det = np.linalg.det(A)
		print "\ndeterminant is\n"
		print det
		
		if(abs(det) < 1.0e-6):
			print "\ndeterminant is zero,inverse doesn't exist\n"
		else: 
			A_inv = A.I
			print "\nmatrix inverse is\n"
			print A_inv
			x = A_inv * b
			print "\nvalues of unknowns are\n"
			print x
	else:
		print "\n matrix is not square\n"
