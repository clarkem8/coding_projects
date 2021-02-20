import logging

class Controller:
    """Controller process to manage system procs"""
    # Initialise with a = Controller()
    def __init__(self):
        self.name = 'test'
        logging.info('Test check')

    def test(self):
        """Test function"""
        print(self.name)
