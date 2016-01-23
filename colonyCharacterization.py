########################################################
#  Find per-strain colony count from petri dish image  #
#                 Author: Diondra D. Peck              #
#                    The Sanchez Lab                   #
#            The Rowland Institute at Harvard          #
########################################################

import numpy as np
import pylab
import mahotas as mh
from matplotlib import pyplot as plt

## Read and apply gaussian filter
I = mh.imread('file.jpeg')
I = np.invert(I)
pylab.imshow(I, cmap = pylab.gray())
pylab.show()

I_filt = mh.gaussian_filter(I, 2)
I_filt = (I_filt > I_filt.mean())
pylab.imshow(I_filt)
pylab.show()

## Label all connected components
labeled, objects = mh.label(I_filt)

## Separate overlapping colonies


## Remove non-colony objects (e.g. petri dish)
relabeled, colonies = mh.labeled.filter_labeled(labeled, remove_bordering = True, min_size = 7, max_size = 12500)
pylab.imshow(relabeled)
pylab.show()













