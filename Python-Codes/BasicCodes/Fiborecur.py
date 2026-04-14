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
