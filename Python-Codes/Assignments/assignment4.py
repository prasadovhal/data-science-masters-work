#Q1: Write a python program to add all the odd numbers from 0 to 20. 
sum(range(1,20,2))

#Q2: Write a python program to add all the even numbers between 0 to 20.
sum(range(0,20,2))

#Q3: Write a python program to find the sum of all integers greater than 100 and less than 200.
sum(range(101,200))

Q4: Write a python program to display a Multiplication table of a number enter from keyboard.
x = input("enter number:")
range(x,x*11,x)

#Q5: Write a program to display the sum of square of the first ten even natural numbers 
#// (2*2+ 4*4 + 6*6 + 8*8 + 10*10 + 12*12 + 14 * 14 + 16 * 16 + 18*18 + 20*20)
a = range(0,21,2)
sum = 0
for x in a :
	sum =sum + (x * x)
sum

#Q6: Write a program to display the sum of cube of first ten even natural numbers 
#// (2*2*2+ 4*4*4 + 6*6*6 + 8*8*8 + 10*10*10 + 12*12*12 + 14 * 14 * 14 + 16 * 16 *16 + 18*18*18 + 20*20*20)
a = range(0,21,2)
sum = 0
for x in a :
	sum =sum + (x**3)
sum

#Q7: Display the sum of: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 + 1/19 + 1/22 + 1/25
a = range(1,26,3)
sum = 0
for x in a :
	sum =sum + (1.0/x)
sum

#Q8: Write a python program  to display ascii characters from 65 to 90   
a = range(65,91)
for x in a:
	chr(x)
      
#Q9: Display ascii characters from 48 to 57.
a = range(48,58)
for x in a:
	chr(x)


#Q10: Display the following output with the help of Ascii character.


#Q11: write a python program to swap two variables provided by the user.
a = input("enter first number:")
b = input("enter second number:")
temp = a
a = b
b = temp
a
b

#Q12: The marks obtained by a student in 5 different Subjects are input through a keyboard. The Student gets a division as per the following rules.
#1.	Percentage above or equal to 60  First Division
#2.	Percentage between 50 and 59  Second Division
#3.	Percentage between 40 and 49  Third Division
#4.	Percentage less than 40  Fail
#Write a python program to Display the result based on the above Criteria.
a = input("Enter marks of 5 subs separeted by coma")
sum = 0
for x in a:
	sum = sum + x
b = float(sum)/5

if b >= 60.0:
	print("First Division")
elif b >= 50.0 and b <60.0:
	print("Second Division")
elif b >= 40.0 and b <50.0:
	print("Third Division")
else:
	print("Fail")

#Q13: write a Python program to find the largest number among the three input numbers
a = input("Enter three no's: ")
max(a)

#Q14: write a Python program to find the factorial of a number provided by the user
fact= 1
a = input("Enter a no")
b =  range(1,(a+1))
for x in b:
	fact = fact * x
fact
	

#Q15: write a Python program to check if the input number is prime or not.
import math
a = input("Enter a no: ")
b = math.ceil(math.sqrt(a))
c = range(2,int(b+1))
e =[]
if a == 1 or a==2:
	print("prime")
else:
	for x in c:
		d = a%x
		e.append(d)		
	
#	if d!=0:
#		print("prime")
#	else:
#		print("not")

#print(e)

if 0 in e:
	print("not prime")
else:
	print("prime")

print("====================Thank You=====================")




