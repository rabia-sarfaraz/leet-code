class Solution {
  static const int MOD = 1000000007;

  int numberOfSets(int n, int k) {
    List<List<int>> dp = List.generate(
      n + 1,
      (_) => List.filled(k + 1, 0),
    );

    List<List<int>> prefix = List.generate(
      n + 1,
      (_) => List.filled(k + 1, 0),
    );

    for (int i = 0; i <= n; i++) {
      dp[i][0] = 1;
      prefix[i][0] = i + 1;
    }

    for (int j = 1; j <= k; j++) {
      for (int i = 1; i <= n; i++) {
        dp[i][j] = (dp[i - 1][j] + prefix[i - 1][j - 1]) % MOD;
        prefix[i][j] = (prefix[i - 1][j] + dp[i][j]) % MOD;
      }
    }

    return dp[n - 1][k];
  }
}