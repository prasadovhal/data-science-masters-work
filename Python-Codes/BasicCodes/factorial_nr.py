def fact(n):
	fact = 1
	ran = range(1,(n+1))
	for i in ran:
		fact = fact * i
	return fact 
	
fact(4)
