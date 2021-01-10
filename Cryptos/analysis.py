import general
import pandas as pd

obj = general.CoinbaseClient()

l = obj.pull_data('BTC-EUR', '2021-01-08T20:00:00.000000', '2021-01-08T21:00:00.000000', 300)
df = pd.DataFrame(l)
df.columns = ['time', 'low', 'high', 'open', 'close', 'volume']
df['time'] = pd.to_datetime(df['time'], unit='s')

print(df)
