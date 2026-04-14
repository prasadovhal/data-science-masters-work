#which ffmpeg
import numpy as np
import matplotlib.pyplot as plt

def f(t,x):
	return 0.5 / np.cosh(0.5 * (x-t))**2
	
def draw_frame(t,x):
	""" draw a frame """
	plt.plot(x, f(t,x))
	plt.axis((0.0,60.0,0.0,0.5))
	plt.xlabel('X')
	plt.ylabel('Y')
	plt.title('Solution at t = %5.0lf'%t)
	
x = np.linspace(0.0,60.0,1001)
t = np.linspace(-10.0,70.0,801)

for i in range(len(t)):
	file_name = '_temp%05d.png' % i
	draw_frame(t[i],x)
	plt.savefig(file_name)
	plt.clf()			#clear frame
	
import os
os.system(" /usr/bin/ffmpeg -r 25 " +
" -i _temp%05d.png -b:v 1800 _movie.mpg ")
os.system("rm _temp*.png")
