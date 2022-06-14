"""Script to run daemon process"""


import asyncio
import logging
import aiohttp
import psutil
from aiohttp.web import Response

from controller import Controller

async def home(req):
    """Returns OK message for GET request"""
    raise aiohttp.web.HTTPOk()

async def check_proc():
    """Checking for running process"""
    while True:
        logging.info('Checking processes are running')
        await asyncio.sleep(10)

async def start_timer(app):
    """Running timer to check on processes"""
    asyncio.get_event_loop().create_task(check_proc())


def start_logging():
    """Starting daemon logging"""
    logfile = '/home/clarkem8/log/daemon.log'
    open(logfile, 'w')
    logging.basicConfig(filename=logfile,
                        level=logging.DEBUG,
                        format='%(asctime)s %(message)s',
                        datefmt='%d/%m/%Y %H:%M:%S')

if __name__ == '__main__':
    start_logging()
    logging.info('Starting daemon process for managing KDB processes')
    controller = Controller()
    controller.start_processes()
    APP = aiohttp.web.Application()
    APP.router.add_route('*', '/', home)
    APP.on_startup.append(start_timer)
    logging.info('Timer started')
    aiohttp.web.run_app(APP, port=23000)
