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
        self.running_processes = {}
        self.expected_processes = self.get_processes()

    def start_proc(self, pname, port):
        """Start a background process"""
        logfile = f'/home/clarkem8/log/{pname}.log'
        logfileh = open(logfile, 'w')
        logging.info('Starting process - %s', pname)

        script_dir = f'/home/clarkem8/github/coding_projects/kdb/src/'
        args = ['q', f'{script_dir}start.q', '-p', str(port), '-proc', pname, '-path', script_dir]
        process = psutil.Popen(args,
                                stdout=logfileh,
                                stderr=logfileh)
        res = process.poll()
        logging.info('Started process - %s - %s', pname, res)
        return process

    def get_processes(self):
        """Get processes to run"""
        df = pd.read_csv(f'{self.rootdir}/config/processes.csv')
        return df

    def start_processes(self):
        """Start all processes"""

        required = self.expected_processes
        d = self.running_processes
        for _, row in required.iterrows():
            pname = row['process']
            port = row['port']
            process = self.start_proc(pname, port)
            logging.info('Process started on %s', process.pid)
            d.update({pname : process})

    def check_processes(self):
        """Check that all processes are running"""
        d = self.running_processes
        for proc in d.keys():
            process = d[proc]
            pid = process.pid
            running = self.look_for_process(proc, process)
            if running:
                logging.info('%s is running on %s', proc, pid)
            else:
                logging.info('%s is stopped, restarting...', proc)

    def look_for_process(self, proc, process):
        """Look for running process"""
        logging.info('Checking - %s', proc)
        # Checks for running subprocess and will free pid
        # otherwise psutil.pid_exists would still return true
        process.poll()
        return psutil.pid_exists(process.pid)

