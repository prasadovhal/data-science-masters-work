class StringClass:
    def __init__(self):
        self.s1=""
    def getString(self):
        s=input("Enter a in lower String: ")
        self.s1=s
    def printString(self):
        print(self.s1.upper())

s=StringClass()
s.getString()
s.printString()
        
