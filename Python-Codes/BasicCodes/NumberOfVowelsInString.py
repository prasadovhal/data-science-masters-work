s=input("Enter a string: ")
countA=0
countE=0
countI=0
countO=0
countU=0
for i in s:
    if i=='a' or i=='A':
        countA=countA+1
    elif i=='e' or i=='E':
        countE=countE+1
    elif i=='i' or i=='I':
        countI=countI+1
    elif i=='o' or i=='O':
        countO=countO+1
    elif i=='u' or i=='U':
        countU=countU+1
    else:
        continue
print("A\tE\tI\tO\tU")
print("%d\t%d\t%d\t%d\t%d" % (countA,countE,countI,countO,countU))
