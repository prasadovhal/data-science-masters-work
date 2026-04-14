import numpy as np
import math as m
def quad(a,b,c):
	dis = b**2-4*a*c

	if (dis > 0 ):
		print "roots are real"
		r1 = (-b + m.sqrt(dis))/float(2*a)
		r2 = (-b - m.sqrt(dis))/float(2*a)
		if(r1 >= 0 and r2 >= 0):
			print"(x - %lf) * (%lf*x - %lf)"% (r1,a,r2*a)
		elif(r1 <= 0 and r2 >= 0):
			print"(x - %lf) * (%lf*x + %lf)"% (r1,a,-r2*a)
		elif(r1 >= 0 and r2 <= 0):
			print"(x - %lf) * (%lf*x + %lf)"% (r1,a,-r2*a)
		elif(r1 <= 0 and r2 <= 0):
			print"(x + %lf) * (%lf*x + %lf)"% (-r1,a,-r2*a) 
	elif (dis < 0):
		print "roots are imaginary"
		dis = -dis
		r1 = (-b + np.sqrt(dis+0j))/float(2*a)
		r2 = (-b - np.sqrt(dis+0j))/float(2*a)
		#print r1,r2
		if(np.real(r1) >= 0 and np.real(r2) >= 0):
			print"(x - %lf) * (%lf*x - %lf)"% (r1,a,r2*a)
		elif(np.real(r1) <= 0 and np.real(r2) >= 0):
			print"(x - %lf) * (%lf*x + %lf)"% (r1,a,-r2*a)
		elif(np.real(r1) >= 0 and np.real(r2) <= 0):
			print"(x - %lf) * (%lf*x + %lf)"% (r1,a,-r2*a)
		elif(np.real(r1) <= 0 and np.real(r2) <= 0):
			print"(x + %lf) * (%lf*x + %lf)"% (-r1,a,-r2*a) 
	else:
		print "roots are similar" 
		r1 = -b/float(2*a)
		if(r1 > 0):
			print"(x - %lf) * (%lf*x - %lf)"% (r1,a,r1*a)
		elif(r1 < 0 ):
			print"(x + %lf) * (%lf*x + %lf)"% (-r1,a,-r1*a)
		elif(r1 == 0 ):
			print"(x - %lf) "% (r1)
		
