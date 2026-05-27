import heapq
from collections import defaultdict

class Solution(object):
    def maxProbability(self, n, edges, succProb, start_node, end_node):
        """
        :type n: int
        :type edges: List[List[int]]
        :type succProb: List[float]
        :type start_node: int
        :type end_node: int
        :rtype: float
        """
        
        graph = defaultdict(list)

        for (u, v), p in zip(edges, succProb):
            graph[u].append((v, p))
            graph[v].append((u, p))

        max_prob = [0.0] * n
        max_prob[start_node] = 1.0

        heap = [(-1.0, start_node)]  # max heap

        while heap:
            prob, node = heapq.heappop(heap)
            prob = -prob

            if node == end_node:
                return prob

            if prob < max_prob[node]:
                continue

            for nei, p in graph[node]:
                new_prob = prob * p

                if new_prob > max_prob[nei]:
                    max_prob[nei] = new_prob
                    heapq.heappush(heap, (-new_prob, nei))

        return 0.0