import heapq

class Solution(object):
    def maxEvents(self, events):
        events.sort()
        
        min_heap = []
        day = 0
        i = 0
        n = len(events)
        result = 0
        
        while i < n or min_heap:
            if not min_heap:
                day = events[i][0]
            
            # add all events starting today
            while i < n and events[i][0] == day:
                heapq.heappush(min_heap, events[i][1])
                i += 1
            
            # remove expired events
            while min_heap and min_heap[0] < day:
                heapq.heappop(min_heap)
            
            # attend one event
            if min_heap:
                heapq.heappop(min_heap)
                result += 1
                day += 1
        
        return result