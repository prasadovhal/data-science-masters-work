import numpy as np
import math as m
import matplotlib.pyplot as plt
import pylab as pl

#cartesian plot

x = np.arange(5)
y = x**3
z = x**2

plt.ion()
plt.plot(x,y,"r--d")
plt.plot(x,z,"r--d")
pl.axis([-1,9,-1,9])
pl.xlabel("X")
pl.ylabel("Y and Z")
pl.title("Plot of X vs Y and Z")


#polar plot

theta = np.linspace(0.0,2.0*m.pi,401)
r1 = np.abs(np.cos(5.0*theta) - 1.5*np.sin(3.0*theta))
r2 = theta / np.pi
r3 = 2.25 * np.ones_like(theta)
#plt.ion()
plt.polar(theta,r1,label = "trig")
plt.polar(theta,r2,label = "spiral")
plt.polar(theta,r3,label = "circle")
plt.thetagrids(np.arange(45,360,90),('NE','NW','SW','SE'))
plt.rgrids((0.5,1.0,1.5,2.0,2.5),angle = 290)
plt.legend(loc = 'best')
plt.show()
plt.savefig("polar.png")
