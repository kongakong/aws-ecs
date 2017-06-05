import boto
import boto.sqs.queue
import time

import logging
import env

LOG = logging.getLogger(__name__)


class Consumer(object):
    def __init__(self):
        self.conn = boto.sqs.connect_to_region('ap-southeast-2',
            aws_access_key_id=env.aws_access_id,
            aws_secret_access_key=env.aws_secret_key)
        self.queue = self.conn.get_queue('task-test')

    def start(self):
        while True:
            messages = self.queue.get_messages(num_messages=1)
            if messages:
                message = messages[0]
                data = message.get_body()
                print data
                self.queue.delete_message(message)
                time.sleep(30)
                LOG.info(data)
