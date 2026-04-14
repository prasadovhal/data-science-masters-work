import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def eqn(y,x):
	Y1 = y[0]
	Y2 = y[1]
	Y3 = -x + 1.0 - x**2 * Y2 + 5.0 * Y1
	return (Y2,Y3)

y0 = [0,-1]

x = np.linspace(0,0.1,20)

y =  odeint(eqn,y0,x)

print y

y1 = y[:,0]
y2 = y[:,1]

plt.plot(x,y1,"r--",lw=2)
plt.plot(x,y2,"b",lw=2)
plt.show()

