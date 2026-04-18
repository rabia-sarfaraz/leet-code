class Solution {
  int palindromePartition(String s, int k) {
    int n = s.length;

    List<List<int>> cost =
        List.generate(n, (_) => List.filled(n, 0));

    // Step 1: compute cost
    for (int len = 2; len <= n; len++) {
      for (int i = 0; i + len - 1 < n; i++) {
        int j = i + len - 1;

        cost[i][j] =
            cost[i + 1][j - 1] +
                (s[i] == s[j] ? 0 : 1);
      }
    }

    List<List<int>> dp =
        List.generate(k + 1, (_) => List.filled(n, 1000000));

    dp[0][0] = 0;

    for (int p = 1; p <= k; p++) {
      for (int i = 0; i < n; i++) {
        if (p == 1) {
          dp[p][i] = cost[0][i];
        } else {
          for (int j = 0; j < i; j++) {
            dp[p][i] =
                dp[p][i] < dp[p - 1][j] + cost[j + 1][i]
                    ? dp[p][i]
                    : dp[p - 1][j] + cost[j + 1][i];
          }
        }
      }
    }

    return dp[k][n - 1];
  }
}