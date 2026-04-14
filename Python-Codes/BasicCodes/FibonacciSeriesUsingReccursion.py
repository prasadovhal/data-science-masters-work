def fibo(num):
    if(num<=1):
        return 1
    else:
        return(fibo(num-2)+fibo(num-1))

n=int(input("Enter the number of terms: "))
for i in range(n):
    print(fibo(i))
