import numpy as np
import pandas as pd
from sklearn import *
raw_data = "normalized_data.csv"
data = pd.read_csv(raw_data, header=None)
clf = linear_model.LinearRegression(fit_intercept=False)
clf.fit(data.ix[:, 0:3], data.ix[:, 4])
print("Residual sum of squares: %.2f"
      % np.mean(abs((clf.predict(data.ix[:, 0:3]) - data.ix[:, 4]))))
print clf.coef_
