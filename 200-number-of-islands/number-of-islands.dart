class Solution {
  int numIslands(List<List<String>> grid) {
    if (grid.isEmpty) return 0;

    int rows = grid.length;
    int cols = grid[0].length;
    int count = 0;

    void dfs(int r, int c) {
      if (r < 0 || c < 0 || r >= rows || c >= cols || grid[r][c] == "0") {
        return;
      }

      grid[r][c] = "0"; // mark visited

      dfs(r + 1, c);
      dfs(r - 1, c);
      dfs(r, c + 1);
      dfs(r, c - 1);
    }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == "1") {
          count++;
          dfs(i, j);
        }
      }
    }

    return count;
  }
}