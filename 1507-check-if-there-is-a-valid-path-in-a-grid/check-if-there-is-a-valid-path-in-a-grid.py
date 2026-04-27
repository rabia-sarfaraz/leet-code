from collections import deque

class Solution(object):
    def hasValidPath(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: bool
        """
        m, n = len(grid), len(grid[0])

        directions = {
            1: [(0, -1), (0, 1)],    # left, right
            2: [(-1, 0), (1, 0)],    # up, down
            3: [(0, -1), (1, 0)],    # left, down
            4: [(0, 1), (1, 0)],     # right, down
            5: [(0, -1), (-1, 0)],   # left, up
            6: [(0, 1), (-1, 0)]     # right, up
        }

        visited = set()
        q = deque([(0, 0)])
        visited.add((0, 0))

        while q:
            x, y = q.popleft()

            if x == m - 1 and y == n - 1:
                return True

            for dx, dy in directions[grid[x][y]]:
                nx, ny = x + dx, y + dy

                if 0 <= nx < m and 0 <= ny < n and (nx, ny) not in visited:
                    # Neighbor must connect back
                    if (-dx, -dy) in directions[grid[nx][ny]]:
                        visited.add((nx, ny))
                        q.append((nx, ny))

        return False