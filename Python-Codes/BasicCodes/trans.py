import math as m
import numpy as np
import matplotlib.pyplot as plt


def sq(k,R):
	x = np.linspace(-m.pi,m.pi,k)
	u = []
	v = 0
	k = range(1,k,2)
	for i in k:
		tmp = (2 * R * m.sin(i * x[i])) / float(i * m.pi)
		v = v + tmp
		u.append(v)
	print len(x)
#	u.extend(u)
	print len(u)
	x = [v for i, v in enumerate(x) if i % 2 != 0]
	print len(x)
	plt.plot(x,u)
	plt.show()
