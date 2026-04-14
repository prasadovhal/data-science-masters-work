from math import *
def tri(a,b,c):   
	eps = 1.0e-12
	#a = input("enter one side of triangle : ")
	#b = input("enter one side of triangle : ")
	#c = input("enter one side of triangle : ")
	if (((a + b - c) < eps) or ((b + c - a) < eps) or ((a + c - b) < eps)):
		print("Triangle is not possible")
	else : 	
		if (((fabs(a-b) < eps) and fabs(a-c) != 0) or ((fabs(b-c) < eps) and fabs(a-c) != 0) or ((fabs(a-c) < eps) and fabs(b-c) != 0)):
			print("Triangle is isosceles")
			if (fabs((a**2-(b**2+c**2))) < eps or fabs((b**2-(a**2+c**2))) < eps or fabs((c**2-(b**2+a**2)))<eps):
				print("Right angle triangle also")
		elif ((fabs(a-b) < eps) and (fabs(b-c) < eps) and (fabs(a-c) < eps)):
			print("Triangle is equilateral")
		else :
			print("Triangle is scalene")
			if (fabs(((a**2-(b**2+c**2))) < eps) or (fabs((b**2-(a**2+c**2))) < eps) or (fabs((c**2-(b**2+a**2)))<eps)):
				print("Right angle triangle also")
			
			
		A = degrees(acos((c**2 + b**2 - a**2)/float(2*b*c)))
		B = degrees(acos((a**2 + c**2 - b**2)/float(2*a*c)))
		C = degrees(acos((a**2 + b**2 - c**2)/float(2*a*b)))
		print A,B,C
