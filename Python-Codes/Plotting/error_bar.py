#more on matplotlib.org
#errorbar plot

import numpy as np
import matplotlib.pyplot as plt
import numpy.random as npr

x = np.linspace(0,4,21)
y = np.exp(-x)
xe = 0.08 * npr.randn(len(x)) 
ye = 0.10 * npr.randn(len(y))
plt.errorbar(x,y,fmt = 'bo', lw = 2 ,xerr = xe , yerr = ye , ecolor = 'r', elinewidth = 1)
plt.show()


#annotation

x = np.linspace(0,2,100)
y =  (x-1)**3 + 1

plt.plot(x,y)
plt.annotate('point of inflation at x = 1', xy = (1,1), xytext=(0.8,0.5) ,arrowprops = dict(facecolor = 'black',width = 1,shrink = 0.05))
pl.axis(-1,9,-1,9)
pl.xlabel("X",style="italic")
pl.ylabel("Y",style="italic")
pl.title(r"$\mathbf{y = (x-1)^3 + 1}$",fontsize = 20)

plt.show()
