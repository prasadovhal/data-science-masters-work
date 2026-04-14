#Q1: write a Python program to check if the input year is a leap year or not.
def l(x):
	if x%4==0:
		print("It is a leap year")
	else:
		print("It is not a leap year")
	
#Q2: write a Program to display the Fibonacci sequence up to n-th term where n is provided by the user
def fibo(n):
	f1 = 0
	f2 = 1
	fi = [f1,f2]
	ran = range(0,(n+1))
	for x in ran:
		f = f1 + f2
		fi.append(f)
		f1 = f2
		f2 = f
	print(fi)  
	
#Q.3:Program to count the number of each vowel in a string. 
def vowel():
	string = raw_input("enter string : ")
	vow = ['a','e','i','o','u','A','E','I','O','U']
	ran = range(0,len(string))
	i = 0
	
	for x in ran:
		for y in ran:
			if vow[x]==string[y]:
				i = i + 1
	print(i)

#Q4: write a Program to check if a string is palindrome or not
def palin():
	string = raw_input("enter string : ")
	string_rev = string[::-1]
	
	if string == string_rev:
		print("string is palindrome")
	else : 
		print("string is not palindrome")
		
#Q5: write a Program to sort alphabetically the words form a string provided by the user. 

def sort():
	string = raw_input("enter string : ")
	
	ran = range(len(string))
	empty = []
	for x in ran :
		z = string[x]
		empty.append(z)
		#print(empty)
	empty.sort()
	sorted = ''	
	for x in empty :
		sorted = sorted + x
	print(sorted)
	
#Q6: write a Program to Remove Punctuations from a String provided by the user
def p():
	a = "Hello, Python! . kasa ahes?"
	p = [32] + range(65,91)+ range (97,123) 
	q = range(len(a))
	b =[]
	for x in q:
		for y in p:
			if a[x] == chr(y):
				b.append(a[x])
	#print(b)
	
	sorted = ''	
	for x in b :
		sorted = sorted + x
	print(sorted)
