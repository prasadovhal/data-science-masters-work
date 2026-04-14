#Q.1 : find area and circumference of circle 
def circle(r):
	from math import pi
	area = pi * r**2
	cf = 2*pi*r
	return area,cf
	
#Q.2 : extract even index of matrix
#def mat(m,n):
#	from numpy import *
#	M = random.rand(m,n)
	
	
	
#Q.3 : zero percent in a matrix
def zero():
	import numpy
	M = input("enter matrix consisting of only 0's and 1's :  ")
	size_M = M.shape
	add = sum(M)
	mul = size_M[0] * size_M[1]
	zero_percent = (mul - add) *100 / float (mul)
	return zero_percent
	
#Q.4 : perisum of matrix
def perisum(m,n):
	#from numpy import *
	M = random.rand(m,n)
	print(M)
	r_first = sum(M[0,...])
	r_last  = sum(M[(m-1),...])
	c_first = sum(M[...,0])
	c_last = sum(M[...,(n-1)])
	extra = M[0,0] + M[0,(n-1)] + M[(m-1),0] + M[(m-1),(n-1)]
	perisum = r_first + r_last + c_first + c_last - extra
	return perisum


