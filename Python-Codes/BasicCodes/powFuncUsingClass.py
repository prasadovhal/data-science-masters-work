class CalcPow:
    def __init__(self):
        pass

    def pow1(self,x,n):
        result1=1
        if(n%2==0):
            result=x*x            
            for i in range(n//2):
                result1 *=  result
        else:
            result=x*x
            for i in range(n//2):
                result1 *= result
            result1=result1*x
        return result1

p1=CalcPow()
q=p1.pow1(2,10)
r=p1.pow1(2,9)
print("2^10 = %d, 2^9 = %d" % (q,r))
        
