import math as m

A = input("enter x,y co-ordinate of 1st point : ")
B = input("enter x,y co-ordinate of 2nd point : ")

dotprod = A[0] * B[0] + A[1] * B[1]
OA = m.sqrt((A[0]**2) + (A[1]**2))
OB = m.sqrt((B[0]**2) + (B[1]**2))

theta = m.degrees(m.acos(dotprod / (OA * OB)))
print theta
