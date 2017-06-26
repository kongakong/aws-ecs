import sys
import os
import logging

sys.path.append(os.path.abspath(os.path.dirname(__file__)) + '/../lib')

from simplequeue.Consumer import Consumer

LOG_FORMAT = "%(asctime)-15s pid %(process)6d tid %(thread)4d %(levelname)-8s %(module)-8s %(message)s"

def setup_logging():
    logfile_name = '/var/log/app.log'

    logger = logging.getLogger()
    logger.setLevel(logging.INFO)
    formatter = logging.Formatter(LOG_FORMAT)
    logging_file_handler = logging.handlers.RotatingFileHandler(logfile_name)
    logging_file_handler.setFormatter(formatter)
    logger.addHandler(logging_file_handler)

    return logger

def main():
    LOG = setup_logging()
    LOG.info('Started...')
    c = Consumer()
    c.start()


if __name__ == '__main__':
    main()
