from fractions import Fraction

def mixed(n):
	a = int(n)
	b = n - a
	c = Fraction(b).limit_denominator()
	
	print "%d + %s "%(a,c)
