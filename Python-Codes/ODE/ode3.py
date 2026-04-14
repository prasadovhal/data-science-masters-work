import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

#function that returns dy/dt
def model(z,t):
	x = z[0]
	y = z[1]
	dxdt = 3.0 * np.exp(-t)
	dydt = 3.0 - y  
	return (dxdt,dydt)
	
#initial condition
z0 = [0,0]

#time points
t = np.linspace(0,10)

#solve ode
#k = 0.1
z = odeint(model,z0,t)
x = z[:,0]
y = z[:,1]
print(x)
print(y)
plt.plot(t,x,'r-',linewidth = 2)
plt.plot(t,y,'b:',linewidth = 2)
plt.xlabel('time')
#plt.ylabel('y(t) , x(t)')
plt.legend('y(t),x(t)')
plt.show() 
