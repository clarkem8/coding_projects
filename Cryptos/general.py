import requests
import time
import datetime
import math

import pandas as pd

class CoinbaseClient():
    def __init__(self, api_url='https://api.pro.coinbase.com'):
        print('Running Coinbase init function')
        self.url = 'https://api.pro.coinbase.com'
        self.timeout = 30
        self.auth = None
        self.session = requests.Session()

    def send_req(self, endpoint, method, params=None, data=None):
        url = f'{self.url}/{endpoint}'
        r = self.session.request(method, url, params=params, data=data,
                                    auth=self.auth, timeout=30)
        return r.json()

    def pull_data(self, product, start, end, granularity):
        print(f'Extracting data for {product} at granularity {granularity}')
        endpoint = f'products/{product}/candles'

        start = self.string_to_datetime(start)
        end = self.string_to_datetime(end)
        
        diff = int((end-start).total_seconds())
        tm_list = list(pd.Series(range(0,diff,granularity)))
        size = 200
        slice_lists = [tm_list[i * size:(i + 1) * size] for i in range((len(tm_list) + size - 1) // size )]
        n = len(slice_lists)
        print(f'Number of slices to pull - {n}')
        params = {}
        params['granularity'] = granularity
        
        data = []
        for l in slice_lists:
            params['start'] = start + datetime.timedelta(0, min(l))
            params['end'] = start + datetime.timedelta(0, max(l))
            subset = self.send_req(endpoint, 'get', params)
            a = len(subset)
            print(f'Number of records - {a}')
            for item in subset:
                data.append(item)

        df = pd.DataFrame(data)
        df.columns = ['time', 'low', 'high', 'open', 'close', 'volume']
        return df

    def string_to_datetime(self, tm):
        return datetime.datetime.strptime(tm, '%Y-%m-%d %H:%M:%S')
