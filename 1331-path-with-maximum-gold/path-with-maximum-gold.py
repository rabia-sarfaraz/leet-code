class Solution(object):
    def getMaximumGold(self, grid):
        m, n = len(grid), len(grid[0])
        
        directions = [(0,1), (0,-1), (1,0), (-1,0)]
        
        def dfs(x, y):
            if x < 0 or y < 0 or x >= m or y >= n or grid[x][y] == 0:
                return 0
            
            gold = grid[x][y]
            grid[x][y] = 0  # mark visited
            
            best = 0
            for dx, dy in directions:
                best = max(best, dfs(x + dx, y + dy))
            
            grid[x][y] = gold  # backtrack
            
            return gold + best
        
        ans = 0
        
        for i in range(m):
            for j in range(n):
                if grid[i][j] != 0:
                    ans = max(ans, dfs(i, j))
        
        return ans