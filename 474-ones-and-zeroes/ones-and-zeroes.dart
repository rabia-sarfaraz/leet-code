class Solution {
  int findMaxForm(List<String> strs, int m, int n) {
    List<List<int>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (String s in strs) {
      int zeros = 0;
      int ones = 0;

      for (int i = 0; i < s.length; i++) {
        if (s[i] == '0') zeros++;
        else ones++;
      }

      for (int i = m; i >= zeros; i--) {
        for (int j = n; j >= ones; j--) {
          dp[i][j] = dp[i][j] > (1 + dp[i - zeros][j - ones])
              ? dp[i][j]
              : (1 + dp[i - zeros][j - ones]);
        }
      }
    }

    return dp[m][n];
  }
}