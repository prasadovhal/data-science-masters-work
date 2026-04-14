import numpy as n
from math import *
import pylab as p

t0=0.0
tn=8.0*pi

tdata = n.arange(t0,tn,0.01)

y = n.zeros((tdata.size),dtype=n.float16)

counter = 1
for N in range(1,42,4):
	i = 0
	for t in tdata:
		y[i] = 0.0
		for k in range(1, N+1, 2):
			y[i]= y[i] + sin(k*t) /float(k)
		y[i] = 4.0*y[i]/pi
		i= i+1
	p.subplot(4,3, counter)
	p.plot(tdata, y , '-')
	counter += 1
p.show()

