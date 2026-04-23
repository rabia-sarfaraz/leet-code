import heapq

class Solution(object):
    def isPossible(self, target):
        if len(target) == 1:
            return target[0] == 1
        
        total = sum(target)
        
        # max heap (negative values)
        target = [-x for x in target]
        heapq.heapify(target)
        
        while True:
            largest = -heapq.heappop(target)
            rest = total - largest
            
            # success case
            if largest == 1 or rest == 1:
                return True
            
            # invalid cases
            if rest == 0 or largest < rest:
                return False
            
            new_val = largest % rest
            
            if new_val == 0:
                return False
            
            # update
            total = rest + new_val
            heapq.heappush(target, -new_val)