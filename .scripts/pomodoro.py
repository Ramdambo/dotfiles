import time
import datetime
import argparse
from gi.repository import Notify
import sys

parser = argparse.ArgumentParser()
parser.add_argument(
    '-w', '--work', help='Time you\'ll be working', default=25, type=int)
parser.add_argument('-b', '--small-break',
                    help='Smaller break time', default=5, type=int)
parser.add_argument('-B', '--large-break',
                    help='Larger break time', default=20, type=int)
parser.add_argument('-d', '--duration',
                    help='Total duration', default=120, type=int)
parser.add_argument('-m', '--max_breaks',
                    help='Max amount of small breaks before one large break', default=4, type=int)

args = parser.parse_args()

Notify.init('Pomodoro timer')

start = time.time()
current_state = 'work'
num_small_breaks = 0
max_small_breaks = 4


def total_time_elapsed():
    return time.time() - start

def log(*args):
    now = datetime.datetime.now()
    print(f'[{now.hour}:{now.minute:02d}]', *args)

while total_time_elapsed() < args.duration * 60:
    if current_state == 'work':
        Notify.Notification.new(f'Time to get back to work!').show()
        log(f'Time to get back to work!')
        time.sleep(args.work * 60)
        current_state = 'small_break'
    elif current_state == 'small_break' and num_small_breaks < max_small_breaks:
        Notify.Notification.new(
            f'Time to take a {args.small_break} minute break!').show()
        log(f'Time to take a {args.small_break} minute break!')
        time.sleep(args.small_break * 60)
        current_state = 'work'
        num_small_breaks += 1
    elif current_state == 'small_break' and num_small_breaks >= max_small_breaks:
        Notify.Notification.new(f'Time to take a larger break of {args.large_break} minutes!\
                                You\'re doing great!').show()
        log(f'Time to take a larger break of {args.large_break} minutes!\
                                You\'re doing great!')
        current_state = 'large_break'
        time.sleep(args.large_break * 60)
