col=7
row=4
numWh=col//2
j=1
for i in range(row):
    print(' '*numWh+'*'*j+' '*numWh)
    numWh=numWh-1
    j=j+2
col2=7
row2=3
numWh2=1
j2=col-2
for i1 in range(row+1):
    print(' '*numWh2+'*'*j2+' '*numWh2)
    numWh2=numWh2+1
    j2=j2-2
