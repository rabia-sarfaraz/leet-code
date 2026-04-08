class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int ans = 0;

    int dfs(int r, int c) {
      if (r < 0 || r >= m || c < 0 || c >= n || grid[r][c] == 0) {
        return 0;
      }

      grid[r][c] = 0; // mark visited

      int area = 1;

      area += dfs(r + 1, c);
      area += dfs(r - 1, c);
      area += dfs(r, c + 1);
      area += dfs(r, c - 1);

      return area;
    }

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          int area = dfs(i, j);
          if (area > ans) ans = area;
        }
      }
    }

    return ans;
  }
}