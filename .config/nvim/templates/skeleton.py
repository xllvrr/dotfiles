#!/usr/bin/env python3
"""
[Add module documentation here]

Author: Xllvr
Date: [Add date here]
"""

import pandas as pd
import numpy as np
import cufflinks as cf
import chart_studio.plotly as py
import seaborn as sns
import plotly.express as px

from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
init_notebook_mode(connected=True)
cf.go_offline()
