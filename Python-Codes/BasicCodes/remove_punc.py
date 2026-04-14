#Q6: write a Program to Remove Punctuations from a String provided by the user
#def p():
#a = "Hello, Python! . kasa ahes?"
a = raw_input("Enter string: ")
p = [32] + range(65,91)+ range (97,123) 
q = range(len(a))
b =[]
for x in q:
	for y in p:
		if a[x] == chr(y):
			b.append(a[x])
#print(b)

sorted = ''	
for x in b :
	sorted = sorted + x
print(sorted)

b = sorted.split(" ")

for i in range(b.count("")):
	b.remove("")

#print b


for i in range(len(b)-1):
	for j in range(len(b)-1):
		if(len(b[j]) > len(b[j+1])):
			temp = b[j]
			b[j] = b[j+1]
			b[j+1] = temp

for i in range(len(b)):
	print b[i]

#print b
