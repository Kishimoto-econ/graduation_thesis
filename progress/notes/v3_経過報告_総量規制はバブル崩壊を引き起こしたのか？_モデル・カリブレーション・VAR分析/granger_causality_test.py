import pandas as pd
import numpy as np
from statsmodels.tsa.stattools import adfuller
from statsmodels.tsa.vector_ar.var_model import VAR
from statsmodels.tsa.stattools import grangercausalitytests 

data = pd.read_csv(
    r"C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\data\data.csv",
    header=[0]
)
# print(data)

# log-transform
df = pd.DataFrame({
    "b": np.log(data["b"]).astype(float),
    "k": np.log(data["k"]).astype(float),
    "q": np.log(data["q"]).astype(float),
    "Y": np.log(data["Y"]).astype(float)
})
df = df.dropna()

dates = pd.period_range(
    start="1960Q1",
    periods=len(df),
    freq="Q"
)

df.index = dates
df = df["1960Q1":"2004Q1"]

# get the difference
df_diff = pd.DataFrame({
    "b_diff": df["b"].diff(),
    "k_diff": df["k"].diff(),
    "q_diff": df["q"].diff(),
    "Y_diff": df["Y"].diff()
})
df_diff = df_diff.dropna()

# var modeling
model = VAR(df_diff)
maxlags = 5
lag = model.select_order(maxlags).selected_orders
# print('optimal lag：',lag['aic'],'\n')

# granger causality test
results = model.fit(lag['aic'])
print(results.summary())

variables = ['b_diff', 'k_diff', 'q_diff', 'Y_diff']
for varia in variables:
    print(f"\n===== Granger causality test: {varia} → k =====")
    result = grangercausalitytests(
        df_diff[['k', var]],
        maxlag=10
    )
