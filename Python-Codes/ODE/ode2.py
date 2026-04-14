import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

#function that returns dy/dt
def model(y,t):
	if(t < 10):
		u = 0.0
	else:
		u = 2.0
	dydt = (-y + u) / 5.0
	#dydt = -y + 1
	return dydt
	
#initial condition
y0 = 1

#time points
t = np.linspace(0,35)

#solve ode
#k = 0.1
y = odeint(model,y0,t)
print(y)
plt.plot(t,y,'r-',linewidth = 2)
plt.xlabel('time')
plt.ylabel('y(t)')
plt.show() 
