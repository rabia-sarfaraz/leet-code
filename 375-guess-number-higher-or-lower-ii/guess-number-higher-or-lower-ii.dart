class Solution {
  int getMoneyAmount(int n) {
    List<List<int>> dp = List.generate(n + 1, (_) => List.filled(n + 1, 0));

    for (int len = 2; len <= n; len++) {
      for (int l = 1; l + len - 1 <= n; l++) {
        int r = l + len - 1;
        dp[l][r] = 1 << 30; // infinity

        for (int i = l; i <= r; i++) {
          int left = (i - 1 >= l) ? dp[l][i - 1] : 0;
          int right = (i + 1 <= r) ? dp[i + 1][r] : 0;

          int cost = i + (left > right ? left : right);
          dp[l][r] = dp[l][r] < cost ? dp[l][r] : cost;
        }
      }
    }

    return dp[1][n];
  }
}