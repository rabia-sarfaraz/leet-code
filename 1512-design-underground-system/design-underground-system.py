class UndergroundSystem(object):

    def __init__(self):
        self.check_in = {}   # id -> (station, time)
        self.routes = {}     # (start, end) -> [total_time, count]

    def checkIn(self, id, stationName, t):
        self.check_in[id] = (stationName, t)

    def checkOut(self, id, stationName, t):
        startStation, startTime = self.check_in.pop(id)
        travel_time = t - startTime

        route = (startStation, stationName)

        if route not in self.routes:
            self.routes[route] = [0, 0]

        self.routes[route][0] += travel_time
        self.routes[route][1] += 1

    def getAverageTime(self, startStation, endStation):
        total_time, count = self.routes[(startStation, endStation)]
        return total_time / float(count)