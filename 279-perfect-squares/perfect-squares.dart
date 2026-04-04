class Solution {
  int numSquares(int n) {
    List<int> dp = List.filled(n + 1, 1 << 30);
    dp[0] = 0;

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j * j <= i; j++) {
        int square = j * j;
        dp[i] = dp[i].clamp(0, dp[i]); // safe init style
        dp[i] = dp[i] < (dp[i - square] + 1)
            ? dp[i]
            : (dp[i - square] + 1);
      }
    }

    return dp[n];
  }
}