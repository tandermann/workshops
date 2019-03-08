#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 13 18:51:36 2018

@author: tobias
"""

import numpy as np
import matplotlib.pyplot as plt

a = np.random.rand(100)
b = np.random.rand(100)

print(a)
print(b)

plt.scatter(a,b)
