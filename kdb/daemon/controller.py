"""Module to control processes in environment"""
import logging
import psutil

import pandas as pd


class Controller:
    """Controller process to manage system procs"""
    # Initialise with a = Controller()
    def __init__(self):
        self.name = 'test'
        self.logdir = '/home/clarkem8/log'
        self.rootdir = '/home/clarkem8/github/coding_projects/kdb'

    def test(self):
        """Test function"""
        logging.info('In controller test func')
        logging.info('Log dir is %s', self.logdir)

    def start_proc(self, pname, port):
        """Start a background process"""

        self.test()
        logfile = f'/home/clarkem8/log/{pname}.log'
        logfileh = open(logfile, 'w')
        logging.info('Starting process - %s', pname)

        
        script_dir = f'/home/clarkem8/github/coding_projects/kdb/src/'
        args = ['q', f'{script_dir}start.q', '-p', str(port), '-proc', pname, '-path', script_dir]
        print(args)
        process = psutil.Popen(args,
                                stdout=logfileh,
                                stderr=logfileh)
        logging.info('Started process - %s', pname)


    def get_processes(self):
        """Get processes to run"""
        df = pd.read_csv(f'{self.rootdir}/config/processes.csv')
        return df


    def start_processes(self):
        """Start all processes"""

        required = self.get_processes()
        for index, row in required.iterrows():
            pname = row['process']
            port = row['port']
            self.start_proc(pname, port)

