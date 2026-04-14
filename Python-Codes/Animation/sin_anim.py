import numpy as np
import matplotlib.pyplot as plt
import time

def f(t,x):
	return (np.sin((2*np.pi*x/4)-(2*np.pi*t/3)))**2 + (np.cos((2*np.pi*x/4)-(2*np.pi*t/3)))**2
	
x = np.linspace(0.0,10.0,1001)

plt.ion()
plt.xlabel('x')
plt.ylabel('y')
line, = plt.plot(x,f(10,x))

for t in np.linspace(-2*np.pi,2*np.pi,161):
	line.set_ydata(f(t,x))
	plt.draw()
	plt.title('Solution wave at = %5.1f '%t)
	time.sleep(1.0e-2)
	plt.pause(0.05)
	plt.show()
	
#which ffmpeg -> library to convert images into movie
