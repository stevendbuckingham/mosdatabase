
# coding: utf-8

# The point of this notebook is to run a principalled comparison of all the analysis methods I have been playing around with.
#
# The quality of the output, as well as it's power in discriminating wild-type from resistant larvae, will be used to evaluate the algorithm.
#
# There are generally three approaches:
# 1. Just measure some index of movement, and don't normalize for the number of larvae
# 2. Measure movement and normalize
# 3. Don't do anything analytical, but use machine learning and statistics to decide if a well is alive/dead etc
# Both 1 and 2 would result in a concentration/effect curve.
#
# For measuring movement, we have:
# * measuring the area of changed image by
#  * deciding if a region has changed by greater than a threshold amount
#  * using a foreground detection algorithm
# * tracking using a tracking algorithm, using the velocity alone or a combination of velocity and shape to decide if a larva is swimming
#
# For normalizing, we have:
# * just dividing by the value at t=0
# * counting the larvae and dividing by that value
# * counting the larvae and working out a biological parameter such as the probability of "jumping"
#
# For counting the larvae we can:
# * do a threshold cut and estimate from the area of dark pixels
# * take the edge and fill in, then estimate from the area of positive pixels
# * do a difference-based detection of movement over a very long period to count the total number of larvae, either by foreground detection or simple subtraction
# * use blob detection
# * use a convolutional neuronal network to recognize blobs as being larvae and either counting the blobs so identified or training it to do the counting step
# * train a network to count larvae directly from an image
#
# For "blind" machine learning approaches we have:
# * training to discriminate silent from motion-containing wells, taking either the probability of class or a logistic function as the output
# *

# In[7]:


import pandas as pd
import numpy as np
from skimage.external.tifffile import imread
import glob
import datetime


# In[6]:


# # get a list of the directories to use
# directories = glob.glob('/media/steven/Ca_Backup/mosquito/16*')
#
# # take out the bad ones
# directories=np.array(directories)
# directories = directories[['frozen' not in x for x in directories]]
# directories = directories[['numtest' not in x for x in directories]]
# directories = directories[['pathogen' not in x for x in directories]]
#
# # some directories are empty
# directories = directories[[len(glob.glob(x+'/*min*/'))>0 for x in directories]]
#
# # load in the experimental conditions
# conditions = pd.read_csv('/media/steven/Ca_Backup/mosquito/conditions_aggregated2.csv')

# function to extract the experiment ID from the directory name
def getExptFromFilename(filename):
    return filename.split('/')[5]

# function to extract the time of drug exposure
def getExposureTimeFromPath(path):
    import re
    return re.search('([0-9]*) *min',path).groups()[0]

# function to list all the exposure times in a directory
def getAllExposureTimesInDirectory(directory):
    import re
    return np.unique([re.search('([0-9]* *)min',x).groups()[0] for x in tmp])


# # Simple pixel counting
# This is the simplest approach

# In[ ]:


def movingPixels(movieFileName):
    from skimage.filters import threshold_otsu
    mov = imread(movieFileName)
    s = mov.std(axis=0)
    return s>threshold_otsu(s)

def splitCount(image2d):
    rows = np.array_split(image2d,8)
    sm = np.empty((8,12))
    for r,row in enumerate(rows):
        col = np.array_split(row,12,axis=1)
        for c,cell in enumerate(col):
            sm[r,c]=np.array(cell).sum()
    return sm

def countInFile(filename, fun):
    x = fun(filename)
    mvts = splitCount(x)
    return mvts

def processFile(filename, fun):
    out = pd.DataFrame(columns = ['row','col','readout'])
    mvts = countInFile(filename, fun)
    for r,row in enumerate(mvts):
        for c,col in enumerate(row):
            out.loc[len(out)] = [r,c,mvts[r,c]]
    return out


# # get all the files we are going to do
# for d in directories:
#     files.append(glob.glob(d + '/*/*tif'))
#
# # go through all the files
# dataOut = []
# for f in files:
#     # print('Doing '+f)
#     dataOut.append(processFile(f, movingPixels))
# dataOut_simple = pd.concat(dataOut)
#
# # merge with the conditions
# result = conditions.merge(dataOut_simple, on = ['row','col','experiment'])
#
# # that took a long time to compute so let's save it
# filestr = 'simplePixelResults_'+datetime.strftime(datetime.now(),'%Y%m%d%H%M%S')+'.csv'
# result.to_csv(filestr)


# # Optical Flow
# This is very slow,and gives the same result as movingPixels

# In[ ]:


def getOpticalFlow(movieFileName):
    mov = imread(movieFileName)
    mvt = np.zeros((mov.shape[1], mov.shape[2]))
    for i in range(mov.shape[0]-1):
        this = mov[i]
        next = mov[i+1]
        flow = cv2.calcOpticalFlowFarneback(this,next, None, 0.5, 3, 15, 3, 5, 1.2, 0)
        mag, ang = cv2.cartToPolar(flow[...,0], flow[...,1])
        mvt+=mag
        print('Doing '+str(i))
    return mvt

# go through all the files
# dataOut = []
# for f in files:
#     # print('Doing '+f)
#     dataOut.append(processFile(f, getOpticalFlow))
# dataOut_flow = pd.concat(dataOut)
#
# # merge with the conditions
# result = conditions.merge(dataOut_flow, on = ['row','col','experiment'])
#
# # that took a long time to compute so let's save it
# filestr = 'opticalFlowResults_'+datetime.strftime(datetime.now(),'%Y%m%d%H%M%S')+'.csv'
# result.to_csv(filestr)


# # Foreground separation

# In[ ]:


def getForeground(movieFileName):
    import cv2
    fgbg = cv2.createBackgroundSubtractorMOG2()
    fgbg.setDetectShadows(False)
    fgbg.setVarThreshold(1e6)
    mov = imread(movieFileName)
    for im in mov:
        m=fgbg.apply(im)
    return m

# go through all the files
# dataOut = []
# for f in files:
#     # print('Doing '+f)
#     dataOut.append(processFile(f, getForeground))
# dataOut_foreground = pd.concat(dataOut)
#
# # merge with the conditions
# result = conditions.merge(dataOut_foreground, on = ['row','col','experiment'])
#
# # that took a long time to compute so let's save it
# filestr = 'foregroundSeparationResults_'+datetime.strftime(datetime.now(),'%Y%m%d%H%M%S')+'.csv'
# result.to_csv(filestr)
