import cbpro
import pandas as pd

public_client = cbpro.PublicClient()
public_client.get_products()

res = public_client.get_product_historic_rates('BTC-EUR', '2021-01-08T20:00:00.000000', '2021-01-08T21:00:00.000000', 3600)
pd.DataFrame(res)
