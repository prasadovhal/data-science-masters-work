def gcd(a,b):
	i = 0
	if (a < b):
		temp = a 
		a = b
		b = temp
	
	while(b):
		r = a % b
		a = b
		b = r
		
	return a
