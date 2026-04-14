def hcf(x,y):
    if(x>y):
        smaller=y
    else:
        smaller=x
    for i in range(1,smaller+1):
        if(x%1==0 and y%i==0):
            hcf1=i
    return hcf1

num1=int(input("Enter first number: "))
num2=int(input("Enter second number: "))
print("The HCF of %d and %d is %d" % (num1,num2,hcf(num1,num2)))
