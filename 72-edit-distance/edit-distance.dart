class Solution {
  int minDistance(String word1, String word2) {
    int m = word1.length;
    int n = word2.length;

    List<List<int>> dp =
        List.generate(m + 1, (_) => List.filled(n + 1, 0));

    // base cases
    for (int i = 0; i <= m; i++) dp[i][0] = i;
    for (int j = 0; j <= n; j++) dp[0][j] = j;

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (word1[i - 1] == word2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          int insert = dp[i][j - 1];
          int delete = dp[i - 1][j];
          int replace = dp[i - 1][j - 1];

          dp[i][j] = 1 +
              (insert < delete
                  ? (insert < replace ? insert : replace)
                  : (delete < replace ? delete : replace));
        }
      }
    }

    return dp[m][n];
  }
}