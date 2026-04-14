import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

#function that returns dy/dt
def model(y,t,k):
	#k = 0.3
	dydt = -k * y	#this k can be user argument too , just add it in above function argumnrnt and necessary change hs to be done while solving ode function mentioned below
	return dydt
	
#initial condition
y0 = 5

#time points
t = np.linspace(0,20)

#solve ode
k = 0.1
y1 = odeint(model,y0,t,args = (k,))			#if k is user parameter then add k as a tuple in y equation after t
k = 0.2
y2 = odeint(model,y0,t,args = (k,))
k = 0.5
y3 = odeint(model,y0,t,args = (k,))

plt.plot(t,y1,'r-',linewidth = 2,label= 'k=0.1' )
plt.plot(t,y2,'b--',linewidth = 2,label= 'k=0.2' )
plt.plot(t,y3,'g:',linewidth = 2,label= 'k=0.' )
plt.xlabel('time')
plt.ylabel('y(t)')
plt.legend()
plt.show() 
