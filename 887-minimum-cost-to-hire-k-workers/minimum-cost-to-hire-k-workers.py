import heapq

class Solution(object):
    def mincostToHireWorkers(self, quality, wage, k):
        workers = []

        for q, w in zip(quality, wage):
            ratio = float(w) / q
            workers.append((ratio, q))

        workers.sort()

        max_heap = []  # store negative quality (simulate max heap)
        total_q = 0
        res = float('inf')

        for ratio, q in workers:
            heapq.heappush(max_heap, -q)
            total_q += q

            if len(max_heap) > k:
                total_q += heapq.heappop(max_heap)  # remove largest q (negative fix)

            if len(max_heap) == k:
                res = min(res, total_q * ratio)

        return res