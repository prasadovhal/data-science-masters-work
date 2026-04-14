#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 31 09:40:33 2018

@author: prasad
@Roll No. : CMS1731
"""

import numpy as np
import pandas as pd
from sklearn import datasets,svm,preprocessing

data = pd.DataFrame(datasets.load_breast_cancer().data)
y = datasets.load_breast_cancer().target

scaleData = pd.DataFrame(preprocessing.scale(data))
LUl = np.random.choice(2,len(scaleData),replace=True,p = [0.9,0.1])

labelData = scaleData.iloc[np.where(LUl == 0)]
sizee = len(labelData)
labely = np.array(y[LUl == 0])
length = len(labely)
unlabelData = scaleData.iloc[np.where(LUl == 1)]

"for comparison purpose only"
unalabely = np.array(y[LUl == 1])
predy= np.array([])
unLy = np.array([])

while(True):
    model = svm.SVC(C = 1.0,kernel = "linear",probability = True)
    
    model.fit(labelData,labely)
    pred = model.predict(unlabelData)
    prob = model.predict_proba(unlabelData)
    
    maxValArr = []
    maxYArr = []
    
    for i in range(len(prob)):
        maxValArr.append(max(prob[i]))
        maxYArr.append(np.argmax(prob[i]))
        
    eligibleVal = sorted(maxValArr,reverse=True)[:int(np.ceil((0.1 * len(prob))))]
    eligibleInd = np.where(np.isin(maxValArr,eligibleVal))[0]
    labelData = labelData.append(unlabelData.iloc[eligibleInd])
    predy = np.append(predy,np.array(maxYArr)[eligibleInd])
    unLy = np.append(unLy,np.array(unalabely)[eligibleInd])
    labely = np.append(labely,np.array(maxYArr)[eligibleInd])
    unalabely = np.delete(unalabely,eligibleInd)
    unlabelData = unlabelData.drop(unlabelData.index[eligibleInd])
    if len(unlabelData) == 0:
        break
    
accuracy = sum(unLy == predy)/len(predy)
print(accuracy)
