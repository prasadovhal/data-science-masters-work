def summ(n):
	if n == 1:
		return 1
	else:
		return n + summ(n-1)
