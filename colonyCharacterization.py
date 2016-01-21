#######################################################
#  Find per-strain colony count from petri dish image #
#                 Author: Diondra D. Peck             #
#                 Harvard Biorobotics Lab             #
#######################################################

import numpy as np
import pylab
import mahotas as mh

## Read and filter image using Otsu's thresholding
I = mh.imread('file.jpeg')
pylab.imshow(I)
pylab.gray()
pylab.show()

I_filtered = mh.gaussian_filter(I, 8)
thresh = mh.thresholding.otsu(I_filterd)
pylab.imshow(I_filtered > thresh)
pylab.show()

## 







