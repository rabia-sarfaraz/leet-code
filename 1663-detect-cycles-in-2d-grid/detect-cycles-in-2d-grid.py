class Solution(object):
    def containsCycle(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: bool
        """
        m, n = len(grid), len(grid[0])
        visited = [[False] * n for _ in range(m)]

        dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        def dfs(x, y, px, py, ch):
            visited[x][y] = True

            for dx, dy in dirs:
                nx, ny = x + dx, y + dy

                if nx < 0 or ny < 0 or nx >= m or ny >= n:
                    continue
                if grid[nx][ny] != ch:
                    continue
                if nx == px and ny == py:
                    continue

                if visited[nx][ny]:
                    return True

                if dfs(nx, ny, x, y, ch):
                    return True

            return False

        for i in range(m):
            for j in range(n):
                if not visited[i][j]:
                    if dfs(i, j, -1, -1, grid[i][j]):
                        return True

        return False