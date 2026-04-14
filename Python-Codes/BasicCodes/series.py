import math as m
import numpy as np
import matplotlib.pyplot as plt
import pylab as pl

def sq(i):
	t = np.linspace(-m.pi,m.pi,i/2.0)
	k = np.arange(1,i+1,2)
	tmp = (4.0 / m.pi) * (np.sin(t * k) / k)
	summ = np.cumsum(tmp)
	plt.plot(summ)
	plt.show()
