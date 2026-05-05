class Solution {
  int numOfArrays(int n, int m, int k) {
    const int MOD = 1000000007;

    // strongly typed DP
    List<List<List<int>>> dp = List.generate(
      n + 1,
      (_) => List.generate(
        m + 1,
        (_) => List<int>.filled(k + 1, 0),
      ),
    );

    // base case
    for (int j = 1; j <= m; j++) {
      dp[1][j][1] = 1;
    }

    for (int i = 2; i <= n; i++) {
      for (int c = 1; c <= k; c++) {
        int prefixSum = 0;

        for (int j = 1; j <= m; j++) {

          // case 2: new max
          dp[i][j][c] = prefixSum;

          // case 1: same max
          dp[i][j][c] = (
            dp[i][j][c] +
            ((dp[i - 1][j][c] * j) % MOD)
          ) % MOD;

          // 🔥 FIX HERE
          prefixSum = (
            prefixSum +
            dp[i - 1][j][c - 1]
          ) % MOD;
        }
      }
    }

    int ans = 0;
    for (int j = 1; j <= m; j++) {
      // 🔥 FIX HERE
      ans = (ans + dp[n][j][k]) % MOD;
    }

    return ans;
  }
}