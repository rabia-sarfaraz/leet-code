class Solution {
  int stoneGameV(List<int> stoneValue) {
    int n = stoneValue.length;

    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + stoneValue[i];
    }

    List<List<int>> dp =
        List.generate(n, (_) => List.filled(n, 0));

    for (int len = 2; len <= n; len++) {
      for (int l = 0; l + len - 1 < n; l++) {
        int r = l + len - 1;

        for (int k = l; k < r; k++) {
          int left = prefix[k + 1] - prefix[l];
          int right = prefix[r + 1] - prefix[k + 1];

          if (left < right) {
            dp[l][r] = dp[l][r] > left + dp[l][k]
                ? dp[l][r]
                : left + dp[l][k];
          } else if (left > right) {
            dp[l][r] = dp[l][r] > right + dp[k + 1][r]
                ? dp[l][r]
                : right + dp[k + 1][r];
          } else {
            int best = left +
                (dp[l][k] > dp[k + 1][r]
                    ? dp[l][k]
                    : dp[k + 1][r]);

            dp[l][r] =
                dp[l][r] > best ? dp[l][r] : best;
          }
        }
      }
    }

    return dp[0][n - 1];
  }
}