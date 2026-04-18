class Solution {
  int closedIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    void dfs(int i, int j) {
      if (i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == 1) {
        return;
      }

      grid[i][j] = 1;

      dfs(i + 1, j);
      dfs(i - 1, j);
      dfs(i, j + 1);
      dfs(i, j - 1);
    }

    // Step 1: remove boundary-connected lands
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (i == 0 || j == 0 || i == m - 1 || j == n - 1) {
          if (grid[i][j] == 0) {
            dfs(i, j);
          }
        }
      }
    }

    // Step 2: count remaining islands
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