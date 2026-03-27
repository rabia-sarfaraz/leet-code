class Solution {
  int minPathSum(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> dp = List.filled(n, 0);

    dp[0] = grid[0][0];

    // first row
    for (int j = 1; j < n; j++) {
      dp[j] = dp[j - 1] + grid[0][j];
    }

    for (int i = 1; i < m; i++) {
      dp[0] += grid[i][0]; // first column

      for (int j = 1; j < n; j++) {
        dp[j] = (dp[j] < dp[j - 1] ? dp[j] : dp[j - 1]) + grid[i][j];
      }
    }

    return dp[n - 1];
  }
}