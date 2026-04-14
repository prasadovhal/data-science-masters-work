#contour plot

import numpy as np
import matplotlib.pyplot as plt

[x,y] = np.mgrid[-2.5:2.5:51j,-3:3:61j]
z = x**2 - y**2
#curves = plt.contour(x,y,z,12,colors = 'k')
#plt.clabel(curves) # clabel contour labels
plt.contourf(x,y,z,12)
plt.colorbar()
plt.show()

