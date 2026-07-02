import heapq

class Solution(object):
    def findSafeWalk(self, grid, health):
        """
        :type grid: List[List[int]]
        :type health: int
        :rtype: bool
        """
        m, n = len(grid), len(grid[0])

        dist = [[float('inf')] * n for _ in range(m)]
        dist[0][0] = grid[0][0]

        heap = [(grid[0][0], 0, 0)]
        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while heap:
            cost, x, y = heapq.heappop(heap)

            if cost > dist[x][y]:
                continue

            if x == m - 1 and y == n - 1:
                return cost < health

            for dx, dy in directions:
                nx, ny = x + dx, y + dy

                if 0 <= nx < m and 0 <= ny < n:
                    new_cost = cost + grid[nx][ny]

                    if new_cost < dist[nx][ny]:
                        dist[nx][ny] = new_cost
                        heapq.heappush(heap, (new_cost, nx, ny))

        return False