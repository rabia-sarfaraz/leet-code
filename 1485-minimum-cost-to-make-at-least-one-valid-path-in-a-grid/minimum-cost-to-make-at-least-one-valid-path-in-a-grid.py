from collections import deque

class Solution(object):
    def minCost(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        m, n = len(grid), len(grid[0])

        dirs = {
            1: (0, 1),   # right
            2: (0, -1),  # left
            3: (1, 0),   # down
            4: (-1, 0)   # up
        }

        dist = [[float('inf')] * n for _ in range(m)]
        dist[0][0] = 0

        dq = deque([(0, 0)])

        while dq:
            x, y = dq.popleft()

            for d in range(1, 5):
                dx, dy = dirs[d]
                nx, ny = x + dx, y + dy

                if 0 <= nx < m and 0 <= ny < n:
                    cost = dist[x][y] + (0 if grid[x][y] == d else 1)

                    if cost < dist[nx][ny]:
                        dist[nx][ny] = cost

                        if grid[x][y] == d:
                            dq.appendleft((nx, ny))
                        else:
                            dq.append((nx, ny))

        return dist[m - 1][n - 1]