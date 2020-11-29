import asyncio
import logging
import aiohttp
import psutil

from aiohttp.web import Response

async def home(req):
    """Returns OK message for GET request"""
    raise aiohttp.web.HTTPOk()

async def check_proc():
    """Checking for running process"""
    while True:
        logging.info('Checking processes are running')
        await asyncio.sleep(10)

async def start_timer(app):
    asyncio.get_event_loop().create_task(check_proc())

def start_proc(pname):
    logfile = f'/home/clarkem8/log/{pname}.log'
    print(logfile)
    logfileh = open(logfile, 'w')
    logging.info(f'Starting process - {pname}')
    args = ['q', f'/home/clarkem8/github/coding_projects/kdb/src/{pname}.q', '-p', '23001', '-name', pname]
    print(args)
    process = psutil.Popen(args,
                            stdout=logfileh,
                            stderr=logfileh)
    logging.info(f'Started process - {pname}')

def start_logging():
    logfile = f'/home/clarkem8/log/daemon.log'
    open(logfile, 'w')
    logging.basicConfig(filename=logfile,
                        level=logging.DEBUG,
                        format='%(asctime)s %(message)s',
                        datefmt='%d/%m/%Y %H:%M:%S')

start_logging()

if __name__ == '__main__':
    start_proc('test')
    APP = aiohttp.web.Application()
    APP.router.add_route('*', '/', home)
    APP.on_startup.append(start_timer)
    logging.info('Timer started')
    aiohttp.web.run_app(APP, port=23000)
