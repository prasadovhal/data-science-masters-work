import numpy as np
import matplotlib.pyplot as plt

def polygon(n):
	angle = 2 * m.pi / float(n)
	a = np.arange(n+1)
	plt.plot(np.cos(angle*a),np.sin(angle*a))
	plt.show()
	
n = input("enter number of sides: ")
polygon(n)
