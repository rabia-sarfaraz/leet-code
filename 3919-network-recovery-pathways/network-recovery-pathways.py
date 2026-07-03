from collections import deque

class Solution(object):
    def findMaxPathScore(self, edges, online, k):
        """
        :type edges: List[List[int]]
        :type online: List[bool]
        :type k: int
        :rtype: int
        """
        n = len(online)

        maxW = 0
        for _, _, w in edges:
            maxW = max(maxW, w)

        def check(limit):
            graph = [[] for _ in range(n)]
            indeg = [0] * n

            for u, v, w in edges:
                if w < limit:
                    continue
                if u != 0 and u != n - 1 and not online[u]:
                    continue
                if v != 0 and v != n - 1 and not online[v]:
                    continue
                graph[u].append((v, w))
                indeg[v] += 1

            q = deque()
            for i in range(n):
                if indeg[i] == 0:
                    q.append(i)

            INF = float('inf')
            dist = [INF] * n
            dist[0] = 0

            while q:
                u = q.popleft()

                if dist[u] != INF:
                    for v, w in graph[u]:
                        if dist[u] + w < dist[v]:
                            dist[v] = dist[u] + w

                for v, _ in graph[u]:
                    indeg[v] -= 1
                    if indeg[v] == 0:
                        q.append(v)

            return dist[n - 1] <= k

        lo, hi = 0, maxW
        ans = -1

        while lo <= hi:
            mid = (lo + hi) // 2
            if check(mid):
                ans = mid
                lo = mid + 1
            else:
                hi = mid - 1

        return ans