class Solution {
  int minDistance(String word1, String word2) {
    int m = word1.length;
    int n = word2.length;

    List<List<int>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (word1[i - 1] == word2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
        } else {
          dp[i][j] = dp[i - 1][j] > dp[i][j - 1]
              ? dp[i - 1][j]
              : dp[i][j - 1];
        }
      }
    }

    int lcs = dp[m][n];

    return m + n - 2 * lcs;
  }
}