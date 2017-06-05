#
import sys
import os

sys.path.append(os.path.abspath(os.path.dirname(__file__)) + '/../lib')

from simplequeue.Consumer import Consumer

def main():
    c = Consumer()
    c.start()

if __name__ == '__main__':
    main()
