n=int(input("Enter the number of terms: "))
t1=0
t2=1
temp=0
count=2
print("Fibonacci Series: ")
print(t1)
print(t2)
while count < n:
	temp=t1+t2
	t1=t2
	t2=temp
	count=count+1
	print(temp)
