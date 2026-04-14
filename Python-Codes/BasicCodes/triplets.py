def trip(n):
	for a in range(1,n+1):
		for b in range(a+1,n+1):
			for c in range(b+1,n+1):
				if ((a**2+b**2)==c**2):
					print a,b,c
