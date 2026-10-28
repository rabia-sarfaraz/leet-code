
class Solution {
  int minCost(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<List<Set<int>>> dp = List.generate(
      m,
      (_) => List.generate(n, (_) => <int>{}),
    );

    dp[0][0].add(grid[0][0]);

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (i == 0 && j == 0) continue;

        if (i > 0) {
          for (int x in dp[i - 1][j]) {
            dp[i][j].add(x ^ grid[i][j]);
          }
        }

        if (j > 0) {
          for (int x in dp[i][j - 1]) {
            dp[i][j].add(x ^ grid[i][j]);
          }
        }
      }
    }

    return dp[m - 1][n - 1].reduce((a, b) => a < b ? a : b);
  }
}
