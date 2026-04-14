#odeint -> numerical integration of ODE(ODE must be in variable separated form , integration must be definite)

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

def rhs(Y,t,omega):		#y(t) = -w**2 * y
	y,ydot = Y
	return ydot,-omega**2 * y	#return y_dot and y_double_dot
	
t_arr = np.linspace(0.0,4.0 * np.pi,201)
y_init = [1,0]		#initial conditions for y and ydot
#simple harmonic motion  y != 0 and ydot = 0
omega = 2.0
y_arr = odeint(rhs,y_init,t_arr,args = (omega,))  #Y = y_init
y,ydot = y_arr[:,0] , y_arr[:,1]

plt.ion()
plt.plot(t_arr,y,t_arr,ydot)
plt.figure()
plt.plot(y,ydot)
plt.show()

