import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

#function that returns dy/dt
def model(z,t,u):
	x = z[0]
	y = z[1]
	dxdt = (-x + u ) / 2.0
	dydt = (-y + x ) / 5.0
	return (dxdt,dydt)
	
#initial condition
z0 = [0,0]

#time points
n = 150
t = np.linspace(0,15,n)
u = np.zeros(n)
u[51:] = 2.0

x = np.zeros(n)
y = np.zeros(n)
for i in range(1,n):
	tspan = [t[i-1] , t[i]]
	z = odeint(model,z0,t,args = (u[i],))
	z0 = z[1]
	x[i] = z0[0]
	y[i] = z0[1]

plt.plot(t,u,'k--',linewidth = 2)
plt.plot(t,x,'r-',linewidth = 2)
plt.plot(t,y,'b:',linewidth = 2)
plt.xlabel('time')
#plt.ylabel('y(t) , x(t)')
plt.legend(('u(t)','y(t) , x(t)'))
plt.show() 
