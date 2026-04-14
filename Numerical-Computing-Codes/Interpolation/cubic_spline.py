import numpy as np

x = input("enter given array of x's in comma seperated form : ")
#x = np.array([1,3,5,7,9])
fx = input("enter given array of f(x)'s in comma seperated form : ")
#fx = np.array([0,3,11,27,45])
x_in = input("enter value at which function value has to interpolate : ")
print("note : ")
print("		for natural end condition type natural")
print("		for clamped end condition type clamped")
print("		for not-a-knot type knot")

condition = raw_input("enter type of end condition : ")

if(condition == "clamped"):
	f_dash = [0,0]

delta = []
h = x[1]-x[0]

for i in range(1,len(x)-1):
	delfx = fx[i+1] - 2*fx[i] + fx[i-1]
	delta.append(delfx)

if(condition == "natural"):
	M_0 = 0
	M_n	= 0
elif(condition == "clamped"):
	M_0 = ((6.0/h**2) * (fx[1]-fx[0])) - ((6.0/h**2) * f_dash[0])
	M_n	= ((6.0/h**2) *  f_dash[1]) - ((6.0/h**2) * (fx[len(x)-1] - fx[len(x)-2]))
	
Mat = np.zeros((len(x)-2,len(x)-2))
for i in range(0,len(x)-2):
	for j in range(0,len(x)-2):
		if (i == j):
			Mat[i,j] = 4
		elif(abs(i-j) == 1):
			Mat[i,j] = 1
		elif((i == 0 and j == 0) or (i == (len(x)-2) and j == (len(x)-2))):
			Mat[i,j] = 2
		else:
			Mat[i,j] = 0

Mat = np.mat(Mat)
Mat_inv = Mat.I
delta = (6.0/h**2)*np.mat(delta)

M = np.array(Mat_inv * delta.T)
M = np.insert(M,0,M_0)
M = np.insert(M,len(x)-1,M_n)

s = []
for i in range(1,(len(x))):
	s_i = ((M[i-1] * (x[i]-x_in)**3) + ((M[i] * (x_in-x[i-1])**3)))/(6.0*h) + ((x_in - x[i-1]) * (fx[i]-(h**2 * M[i])/6.0))/h + ((x[i] - x_in) * (fx[i-1]-(h**2 * M[i-1])/6.0))/h
	s.append(s_i)

#print(s)
for i in range(1,(len(x)-1)):
	if((x_in >= x[i-1]) and (x_in <= x[i])):
		S = s[i-1]
	elif((x_in >= x[i]) and (x_in <= x[i+1])):
		S = s[i]
	elif((x_in >= x[i+1]) and (x_in <= x[i+2])):
		S = s[i+1]
print("function vaule at %lf is %lf"%(x_in,S))
