class Solution {
  int minScoreTriangulation(List<int> values) {
    int n = values.length;

    List<List<int>> dp = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    // gap is interval length
    for (int gap = 2; gap < n; gap++) {
      for (int i = 0; i + gap < n; i++) {
        int j = i + gap;

        dp[i][j] = 1 << 30;

        for (int k = i + 1; k < j; k++) {
          int cost = dp[i][k] +
              dp[k][j] +
              values[i] * values[k] * values[j];

          if (cost < dp[i][j]) {
            dp[i][j] = cost;
          }
        }
      }
    }

    return dp[0][n - 1];
  }
}