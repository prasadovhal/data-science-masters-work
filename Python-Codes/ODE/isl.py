import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def eqn(y,t):
	k = 0.1
	Y1 = y[0]
	Y2 = y[1]
	Y3 = k / Y1**2
	return (Y2,Y3)
	
y0 = [1,0]

t = np.random.rand(20)

y = odeint(eqn,y0,t)
print(y)
yy = y[:,0]
plt.plot(t,yy,"k.")
plt.show()
