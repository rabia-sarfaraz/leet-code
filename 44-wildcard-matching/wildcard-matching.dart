class Solution {
  bool isMatch(String s, String p) {
    int m = s.length;
    int n = p.length;

    List<List<bool>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, false),
    );

    dp[0][0] = true;

    // handle patterns like *, **, *** at start
    for (int j = 1; j <= n; j++) {
      if (p[j - 1] == '*') {
        dp[0][j] = dp[0][j - 1];
      }
    }

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (p[j - 1] == s[i - 1] || p[j - 1] == '?') {
          dp[i][j] = dp[i - 1][j - 1];
        } else if (p[j - 1] == '*') {
          dp[i][j] = dp[i - 1][j] || dp[i][j - 1];
        } else {
          dp[i][j] = false;
        }
      }
    }

    return dp[m][n];
  }
}