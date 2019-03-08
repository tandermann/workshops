import numpy as np
import matplotlib.pyplot as plt

def simulate_petal_sepal_length():
    height=None
    weight=None
    gender=None
    if np.random.rand() <= 0.5:
        population = 'pop1'
        petal = np.random.normal(1.5,0.5)
        sepal = np.random.normal(5,0.6)
    else:
        population = 'pop2'
        petal = np.random.normal(5,0.9)
        sepal = np.random.normal(6.3,0.7)        
    return petal, sepal, population


petal_list = []
sepal_list = []
for i in np.arange(50):
    petal, sepal, population = simulate_petal_sepal_length()
    petal_list.append(petal)
    sepal_list.append(sepal)
plt.scatter(petal_list,sepal_list)
plt.xlabel('petal')
plt.ylabel('sepal')
#plt.title('50 randomely generated Normlösa citizens');

sample_list = ['sample%i' %(number+1) for number in np.arange(50)]

import pandas as pd
a_df = pd.DataFrame(index=np.arange(0,len(sample_list)), columns=['sample_name','petal_length','sepal_length'])
a_df['sample_name'] = sample_list
a_df['petal_length'] = petal_list
a_df['sepal_length'] = sepal_list
a_df.to_csv('/Users/tobias/Desktop/petal_sepal_length.txt',index=False,sep='\t')