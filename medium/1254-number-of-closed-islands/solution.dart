class Solution {
  int closedIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    void dfs(int r, int c) {
      if (r < 0 || r >= m || c < 0 || c >= n) return;
      if (grid[r][c] == 1) return;

      grid[r][c] = 1;

      dfs(r - 1, c);
      dfs(r + 1, c);
      dfs(r, c - 1);
      dfs(r, c + 1);
    }

    for (int i = 0; i < m; i++) {
      dfs(i, 0);
      dfs(i, n - 1);
    }

    for (int j = 0; j < n; j++) {
      dfs(0, j);
      dfs(m - 1, j);
    }

    int count = 0;

    for (int i = 1; i < m - 1; i++) {
      for (int j = 1; j < n - 1; j++) {
        if (grid[i][j] == 0) {
          count++;
          dfs(i, j);
        }
      }
    }

    return count;
  }
}