#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 17 09:47:49 2018

@author: prasad
@Roll No. CMS1731
"""

import numpy as np
import pandas as pd
from sklearn import datasets

def distance(x,y):
    return np.sqrt(sum((x - y)**2))

data = pd.read_csv("glass.csv",sep=",")
data.drop(['Type'],axis=1,inplace=True)
#data = pd.DataFrame(datasets.load_iris().data)
shuf = (np.random.choice(len(data),size=len(data),replace=False))
newData = data.iloc[shuf]

save = list(shuf)
cluster = []

while(len(newData) > 1):
    F = []
    while(len(save) >= 1):
        if(len(save)==1):
            F.append([save[0]])
            break
        i = save[0]
        save.remove(i)
        dist = []
        frame1 = pd.DataFrame()
        frame1 = frame1.append(newData.loc[i])
        frame1_mean = frame1.mean(axis=0)
        #print(np.array(save))
        for j in save:
            frame2 = pd.DataFrame()
            frame2 = frame2.append(newData.loc[j])
            frame2_mean = frame2.mean(axis=0)
            d = distance(frame1_mean,frame2_mean)
            dist.append(d)
        ind = np.argmin(dist)
        #print("ind = ",ind)
        F.append([i,save[ind]])
        save.remove(save[ind])
        
    cluster.append(F)
    
    df = pd.DataFrame()
    for i in np.arange(len(F)):
        df = df.append(pd.DataFrame.transpose(pd.DataFrame(newData.iloc[F[i]].mean(axis=0))))
    
    df.reset_index(inplace=True,drop=True)
    newData = df
    save = list(np.arange(len(newData)))

print(cluster)
