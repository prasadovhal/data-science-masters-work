col=7
row=4
numWh=col//2
j=1
for i in range(row):
    print(' '*numWh+'*'*j+' '*numWh)
    numWh=numWh-1
    j=j+2
