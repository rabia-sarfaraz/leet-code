class Solution {
  int strangePrinter(String s) {
    int n = s.length;
    List<List<int>> dp =
        List.generate(n, (_) => List.filled(n, 0));

    for (int i = n - 1; i >= 0; i--) {
      dp[i][i] = 1;

      for (int j = i + 1; j < n; j++) {
        dp[i][j] = 1 + dp[i + 1][j];

        for (int k = i + 1; k <= j; k++) {
          if (s[i] == s[k]) {
            int val = dp[i + 1][k - 1] + dp[k][j];
            if (val < dp[i][j]) {
              dp[i][j] = val;
            }
          }
        }
      }
    }

    return dp[0][n - 1];
  }
}