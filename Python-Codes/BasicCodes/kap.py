def kap(n):
	if (n == 6174):
		return n
	lis = list(str(n))
	lis.sort()

	small = int(lis[0])*1000 + int(lis[1])*100 + int(lis[2])*10 + int(lis[3])
	big = int(lis[3])*1000 + int(lis[2])*100 + int(lis[1])*10 + int(lis[0])

	diff = big - small
	print diff
	return kap(diff)

n = input("enter a number : ")
if(len(str(n)) ==4):
	if(n%1111 != 0):
		kap(n)
	else:
		print "ny hou sakat"
else:
	print "4 anki number tak ki"
