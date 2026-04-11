class Solution {
  int matrixScore(List<List<int>> grid) {
    int n = grid.length;
    int m = grid[0].length;

    // Step 1: Make first column all 1s
    for (int i = 0; i < n; i++) {
      if (grid[i][0] == 0) {
        for (int j = 0; j < m; j++) {
          grid[i][j] = 1 - grid[i][j];
        }
      }
    }

    int result = 0;

    // Step 2: Calculate score column by column
    for (int j = 0; j < m; j++) {
      int ones = 0;

      for (int i = 0; i < n; i++) {
        ones += grid[i][j];
      }

      int best = ones > (n - ones) ? ones : (n - ones);

      result += best * (1 << (m - j - 1));
    }

    return result;
  }
}