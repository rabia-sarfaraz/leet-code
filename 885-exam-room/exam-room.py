class ExamRoom(object):

    def __init__(self, n):
        self.n = n
        self.seats = []

    def seat(self):
        if not self.seats:
            self.seats.append(0)
            return 0

        self.seats.sort()

        best_seat = 0
        max_dist = self.seats[0]  # distance from 0

        # middle gaps check
        for i in range(len(self.seats) - 1):
            prev = self.seats[i]
            nxt = self.seats[i + 1]

            dist = (nxt - prev) // 2

            if dist > max_dist:
                max_dist = dist
                best_seat = prev + dist

        # end gap check
        if (self.n - 1 - self.seats[-1]) > max_dist:
            best_seat = self.n - 1

        self.seats.append(best_seat)
        return best_seat

    def leave(self, p):
        self.seats.remove(p)