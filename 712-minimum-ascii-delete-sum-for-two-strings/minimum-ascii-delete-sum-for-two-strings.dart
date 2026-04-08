class Solution {
  int minimumDeleteSum(String s1, String s2) {
    int m = s1.length, n = s2.length;

    List<List<int>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 0),
    );

    // base cases: delete remaining chars
    for (int i = m - 1; i >= 0; i--) {
      dp[i][n] = dp[i + 1][n] + s1.codeUnitAt(i);
    }

    for (int j = n - 1; j >= 0; j--) {
      dp[m][j] = dp[m][j + 1] + s2.codeUnitAt(j);
    }

    for (int i = m - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        if (s1[i] == s2[j]) {
          dp[i][j] = dp[i + 1][j + 1];
        } else {
          dp[i][j] = [
            s1.codeUnitAt(i) + dp[i + 1][j],
            s2.codeUnitAt(j) + dp[i][j + 1],
          ].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return dp[0][0];
  }
}