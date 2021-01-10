import requests
import time
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
        endpoint = f'products/{product}/candles'
        params = {}
        params['start'] = start
        params['end'] = end
        params['granularity'] = granularity

        data = self.send_req(endpoint, 'get', params)
        return data

