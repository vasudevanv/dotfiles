#!/usr/env/bin python

# Script to plot scaling data

import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

# Global Fontsize
plt.style.use('vvplot')
axlabelsize=16

# Create the matplotlib figure
# Figure size is in inches
# fig = plt.figure(figsize=(3.0,2.625))
fig = plt.figure(figsize=(3.0,3.0))

# Create a grid for different axes
gs = gridspec.GridSpec(1,1)

# Create the individual axes
ax1 = fig.add_subplot(gs[0,0])

# Set some plot parameters
lw = 2.0
ls = 'solid'

# First axis
t = np.arange(0.0, 0.5 + 0.01, 0.01)
ss = [ np.cos(4*np.pi*t+0.5*i) + 2 for i in range(1,9) ]
for s in ss:
    ax1.plot(t, s)

# Set axes labels
ax1.set_ylabel(r"$\left( g(r)-1 \right) / \eta$",fontsize=axlabelsize)
ax1.set_xlabel(r"$\tilde{r}$",fontsize=axlabelsize)

# Set axes limits

# Set the tick marks 

# Tight layout to make sure that there are no overlaps 
# gs.tight_layout(fig,pad=1.05)

# Save a svg file for postprocessing
# plt.show()
plt.savefig('scaling.svg', format='svg', bbox_inches='tight')
