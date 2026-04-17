import threading

class DiningPhilosophers(object):

    def __init__(self):
        self.locks = [threading.Lock() for _ in range(5)]

    def wantsToEat(self, philosopher, pickLeftFork, pickRightFork, eat, putLeftFork, putRightFork):

        left = philosopher
        right = (philosopher + 1) % 5

        first = min(left, right)
        second = max(left, right)

        with self.locks[first]:
            with self.locks[second]:

                # pick forks
                pickLeftFork()
                pickRightFork()

                # eat
                eat()

                # put forks
                putLeftFork()
                putRightFork()