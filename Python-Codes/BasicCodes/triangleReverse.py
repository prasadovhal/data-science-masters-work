col=7
row=4
numWh=0
j=col
for i in range(row):
    print(' '*numWh+'*'*j+' '*numWh)
    numWh=numWh+1
    j=j-2
