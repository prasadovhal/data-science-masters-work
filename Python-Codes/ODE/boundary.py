import math as m
import numpy as np
import scikits.bvp1lg.colnew as colnew  #bvp -> boundary value problem

degress = [2]
boundary_points = np.array([0,np.pi])

tol = 1.0e-8 * np.ones_like(boundary_points)

def fsub(x,Z):
	""" The equations """
	u,du = Z
	return np.array([-u])
	
def gsub(Z):
	""" The Boundary Conditions """
	u,du = Z
	return np.array([u[0],(du[1]-1.0)])			#du[1]-1.0 -> u'(pi) = 1.0
	
solution = colnew.solve(boundary_points, degrees, fsub , gsub, is_linear = True, tolerances = tol, vector = True, maximum_mesh_size = 300)

import matplotlib.pyplot as plt
plt.ion()
x = solution.mesh
u_exact = np.sin(x)
plt.plot(x,solution(x)[:,0] , "b-")
plt.plot(x,u_exact,'r:')
plt.show()

