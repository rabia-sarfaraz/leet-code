class Solution {
  int minCut(String s) {
    int n = s.length;

    // step 1: palindrome table
    List<List<bool>> isPal =
        List.generate(n, (_) => List.filled(n, false));

    for (int i = n - 1; i >= 0; i--) {
      for (int j = i; j < n; j++) {
        if (s[i] == s[j] && (j - i < 2 || isPal[i + 1][j - 1])) {
          isPal[i][j] = true;
        }
      }
    }

    // step 2: dp array
    List<int> dp = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      if (isPal[0][i]) {
        dp[i] = 0;
      } else {
        dp[i] = i;
        for (int j = 0; j < i; j++) {
          if (isPal[j + 1][i]) {
            dp[i] = dp[i].clamp(0, dp[j] + 1);
            if (dp[j] + 1 < dp[i]) {
              dp[i] = dp[j] + 1;
            }
          }
        }
      }
    }

    return dp[n - 1];
  }
}