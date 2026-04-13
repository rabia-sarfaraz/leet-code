class Solution {
  int mergeStones(List<int> stones, int k) {
    int n = stones.length;

    if ((n - 1) % (k - 1) != 0) return -1;

    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + stones[i];
    }

    int rangeSum(int i, int j) {
      return prefix[j + 1] - prefix[i];
    }

    List<List<int>> dp = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    for (int len = k; len <= n; len++) {
      for (int i = 0; i + len <= n; i++) {
        int j = i + len - 1;
        dp[i][j] = 1 << 30;

        for (int m = i; m < j; m += k - 1) {
          dp[i][j] = dp[i][j].clamp(
            0,
            dp[i][m] + dp[m + 1][j],
          );
        }

        if ((len - 1) % (k - 1) == 0) {
          dp[i][j] += rangeSum(i, j);
        }
      }
    }

    return dp[0][n - 1];
  }
}