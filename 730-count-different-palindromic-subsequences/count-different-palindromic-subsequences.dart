class Solution {
  int countPalindromicSubsequences(String s) {
    int n = s.length;
    const int MOD = 1000000007;

    List<List<int>> dp =
        List.generate(n, (_) => List.filled(n, 0));

    for (int i = 0; i < n; i++) {
      dp[i][i] = 1;
    }

    for (int len = 2; len <= n; len++) {
      for (int i = 0; i + len - 1 < n; i++) {
        int j = i + len - 1;

        if (s[i] == s[j]) {
          int l = i + 1;
          int r = j - 1;

          while (l <= r && s[l] != s[i]) l++;
          while (l <= r && s[r] != s[i]) r--;

          if (l > r) {
            // no same char inside
            dp[i][j] = (2 * dp[i + 1][j - 1] + 2) % MOD;
          } else if (l == r) {
            // one same char inside
            dp[i][j] = (2 * dp[i + 1][j - 1] + 1) % MOD;
          } else {
            // more than one same char inside
            dp[i][j] = (2 * dp[i + 1][j - 1] - dp[l + 1][r - 1]) % MOD;
          }
        } else {
          dp[i][j] = (dp[i + 1][j] + dp[i][j - 1] - dp[i + 1][j - 1]) % MOD;
        }

        if (dp[i][j] < 0) dp[i][j] += MOD;
      }
    }

    return dp[0][n - 1];
  }
}