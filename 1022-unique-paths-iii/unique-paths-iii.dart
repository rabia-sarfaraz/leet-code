class Solution {
  int rows = 0, cols = 0;
  int result = 0;
  int empty = 0;

  int uniquePathsIII(List<List<int>> grid) {
    rows = grid.length;
    cols = grid[0].length;

    int startX = 0, startY = 0;

    // count empty cells + find start
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == 0) empty++;
        if (grid[i][j] == 1) {
          startX = i;
          startY = j;
        }
      }
    }

    dfs(grid, startX, startY, empty + 1); // +1 for start
    return result;
  }

  void dfs(List<List<int>> grid, int x, int y, int remain) {
    // out of bounds / obstacle
    if (x < 0 || y < 0 || x >= rows || y >= cols || grid[x][y] == -1) {
      return;
    }

    // reached end
    if (grid[x][y] == 2) {
      if (remain == 0) result++;
      return;
    }

    // mark visited
    int temp = grid[x][y];
    grid[x][y] = -1;

    // explore 4 directions
    dfs(grid, x + 1, y, remain - 1);
    dfs(grid, x - 1, y, remain - 1);
    dfs(grid, x, y + 1, remain - 1);
    dfs(grid, x, y - 1, remain - 1);

    // backtrack
    grid[x][y] = temp;
  }
}