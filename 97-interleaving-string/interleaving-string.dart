class Solution {
  bool isInterleave(String s1, String s2, String s3) {
    int m = s1.length;
    int n = s2.length;

    if (m + n != s3.length) return false;

    List<List<bool>> dp =
        List.generate(m + 1, (_) => List.filled(n + 1, false));

    dp[0][0] = true;

    // first row
    for (int j = 1; j <= n; j++) {
      dp[0][j] = dp[0][j - 1] && s2[j - 1] == s3[j - 1];
    }

    // first column
    for (int i = 1; i <= m; i++) {
      dp[i][0] = dp[i - 1][0] && s1[i - 1] == s3[i - 1];
    }

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        int k = i + j - 1;

        if (s1[i - 1] == s3[k]) {
          dp[i][j] = dp[i][j] || dp[i - 1][j];
        }

        if (s2[j - 1] == s3[k]) {
          dp[i][j] = dp[i][j] || dp[i][j - 1];
        }
      }
    }

    return dp[m][n];
  }
}