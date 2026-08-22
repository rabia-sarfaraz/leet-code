class Solution {
  int longestPalindrome(String word1, String word2) {
    String s = word1 + word2;
    int n = s.length;
    int m = word1.length;

    List<List<int>> dp =
        List.generate(n, (_) => List.filled(n, 0));

    int ans = 0;

    for (int i = n - 1; i >= 0; i--) {
      dp[i][i] = 1;

      for (int j = i + 1; j < n; j++) {
        if (s[i] == s[j]) {
          dp[i][j] = dp[i + 1][j - 1] + 2;

          // Pair must use one character from each word
          if (i < m && j >= m) {
            ans = ans > dp[i][j] ? ans : dp[i][j];
          }
        } else {
          dp[i][j] =
              dp[i + 1][j] > dp[i][j - 1]
                  ? dp[i + 1][j]
                  : dp[i][j - 1];
        }
      }
    }

    return ans;
  }
}