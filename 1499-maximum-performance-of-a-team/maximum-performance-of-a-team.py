import heapq

class Solution(object):
    def maxPerformance(self, n, speed, efficiency, k):
        MOD = 10**9 + 7

        # pair engineers
        engineers = list(zip(efficiency, speed))

        # sort by efficiency descending
        engineers.sort(reverse=True)

        heap = []
        speed_sum = 0
        ans = 0

        for eff, sp in engineers:

            # add current speed
            heapq.heappush(heap, sp)
            speed_sum += sp

            # keep only k workers
            if len(heap) > k:
                speed_sum -= heapq.heappop(heap)

            # current efficiency is minimum (because sorted desc)
            ans = max(ans, speed_sum * eff)

        return ans % MOD