#Q1.Write a Python Program To Display Powers of 2 Using Anonymous Function. Take number of terms from user

l = lambda x : 2**x

#Q2: Write a Python Program to find numbers divisible by thirteen from a list using anonymous function

def lam(n):
	l = list(filter(lambda x : (x%13 ==0),n))
	return l
	
#Q3: Write a Python program to find the H.C.F of two input number

def gcd(a,b):
	if a < b:
		temp = a
		a = b
		b = temp
	#print(a)
	#print(b)
	rem = a % b
	#print(rem)
	while rem  != 0:
		rem = a % b
		a = b
		b = rem
				
	return a
	
#Q4: Write a Python Program to find the L.C.M. of two input number

def lcm(a,b):
	c = a
	d = b
	if a < b:
		temp = a
		a = b
		b = temp
	#print(a)
	#print(b)
	rem = a % b
	#print(rem)
	while rem  != 0:
		rem = a % b
		a = b
		b = rem
				
	gcd = a
	lcm = c * d / gcd
	return lcm
	
#Q5: Write a Python Program to find the factors of a number

def factor(a):
	c = range(1,((a/2)+1))
	e =[]

	for x in c:
		d = a%x
		if d==0:
			e.append(x)		
	e.append(a)
	return e

#Q6: Write a Program to make a simple calculator that can add, subtract, multiply and divide using functions 

def opt(a,b):
	print("Choose your operation")
	print("1: Addition \n2:subtraction \n3:Multiplication \n4:Division\n")	
	c = input("Enter operation no: ")
	if (c == 1):
		ans = a + b 
	elif (c == 2):
		ans = a - b
	elif (c == 3):
		ans = a * b
	elif (c == 4):
		ans = a / float (b)
	return ans	
	
#Q7: Write a Python program to display the Fibonacci sequence up to n-th term using recursive functions

def fibo(num):
	if (num==0):
		return 0
	elif(num==1):
		return 1
	else:
		return(fibo(num-2)+fibo(num-1))

n=int(input("Enter the number of terms: "))
b = []
for i in range(n):
	a = fibo(i)
	b.append(a)
print(b)


