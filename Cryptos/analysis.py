import general
import pandas as pd

obj = general.CoinbaseClient()

df = obj.pull_data('BTC-EUR', '2021-01-08 20:00:00', '2021-01-08 21:00:00', 300)
df['time'] = pd.to_datetime(df['time'], unit='s')
df = df.sort_values(by=['time'])

print(df)
