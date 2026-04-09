from collections import defaultdict, deque

class Solution(object):
    def findCheapestPrice(self, n, flights, src, dst, k):
        graph = defaultdict(list)

        for u, v, w in flights:
            graph[u].append((v, w))

        # queue: (node, cost, stops)
        q = deque()
        q.append((src, 0, 0))

        # best cost with stops pruning
        dist = {(src, 0): 0}

        ans = float('inf')

        while q:
            node, cost, stops = q.popleft()

            if stops > k + 1:
                continue

            if node == dst:
                ans = min(ans, cost)
                continue

            for nei, price in graph[node]:
                new_cost = cost + price
                new_stops = stops + 1

                if new_cost < ans:
                    if (nei, new_stops) not in dist or new_cost < dist[(nei, new_stops)]:
                        dist[(nei, new_stops)] = new_cost
                        q.append((nei, new_cost, new_stops))

        return -1 if ans == float('inf') else ans