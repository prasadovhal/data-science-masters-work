import numpy as np

def theta(x):
	if(x < 0.0):
		return 0.0
	else:
		return 1.0
		
#theta(np.array[-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0])
theta_vec = np.vectorize(theta)
vect = theta_vec(np.array([-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0]))
print vect
