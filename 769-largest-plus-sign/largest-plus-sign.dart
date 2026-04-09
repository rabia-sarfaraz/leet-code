class Solution {
  int orderOfLargestPlusSign(int n, List<List<int>> mines) {
    List<List<int>> grid = List.generate(
      n,
      (_) => List.filled(n, 1),
    );

    // Mark mines
    for (var m in mines) {
      grid[m[0]][m[1]] = 0;
    }

    List<List<int>> dp = List.generate(
      n,
      (_) => List.filled(n, n),
    );

    // Left and Right pass
    for (int i = 0; i < n; i++) {
      int count = 0;

      for (int j = 0; j < n; j++) {
        count = grid[i][j] == 0 ? 0 : count + 1;
        dp[i][j] = count < dp[i][j] ? count : dp[i][j];
      }

      count = 0;

      for (int j = n - 1; j >= 0; j--) {
        count = grid[i][j] == 0 ? 0 : count + 1;
        dp[i][j] = count < dp[i][j] ? count : dp[i][j];
      }
    }

    // Up and Down pass
    for (int j = 0; j < n; j++) {
      int count = 0;

      for (int i = 0; i < n; i++) {
        count = grid[i][j] == 0 ? 0 : count + 1;
        dp[i][j] = count < dp[i][j] ? count : dp[i][j];
      }

      count = 0;

      for (int i = n - 1; i >= 0; i--) {
        count = grid[i][j] == 0 ? 0 : count + 1;
        dp[i][j] = count < dp[i][j] ? count : dp[i][j];
      }
    }

    int ans = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        ans = ans > dp[i][j] ? ans : dp[i][j];
      }
    }

    return ans;
  }
}