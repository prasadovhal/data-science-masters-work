#anim
import numpy as np
import matplotlib.pyplot as plt
import time

def f(t,x):
	return 0.5/np.cosh(0.5*(x-t))**2
	
x = np.linspace(0.0,60.0,1001)

plt.ion()
plt.xlabel('x')
plt.ylabel('y')
line, = plt.plot(x,f(10,x))

for t in np.linspace(-10,70,161):
	line.set_ydata(f(t,x))
	plt.draw()
	plt.title('Solution wave at = %5.1f '%t)
	time.sleep(1.0e-2)
	plt.pause(0.02)
	plt.show()
