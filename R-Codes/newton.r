options(digits = 16)
 f = expression(x*x - 5)


d = function(eps, n)
{
 De = D(f, "x")
 x0 = x = 2
 temp = 0
 i = 0
 while ((abs(x0 - temp) > eps) && i<n)
 {
 	k = eval(De)
 	kk = eval(f)
	x1 = x0 - (kk/k)
	temp = x0
	x0 = x1
	x = x0

	i = i+1
}
	print(x1)
}
