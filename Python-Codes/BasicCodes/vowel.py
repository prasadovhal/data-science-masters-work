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
