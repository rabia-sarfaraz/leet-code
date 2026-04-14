class Solution {
  String shortestCommonSupersequence(String str1, String str2) {
    int m = str1.length;
    int n = str2.length;

    // Step 1: build LCS dp
    List<List<int>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (str1[i - 1] == str2[j - 1]) {
          dp[i][j] = 1 + dp[i - 1][j - 1];
        } else {
          dp[i][j] = dp[i - 1][j] > dp[i][j - 1]
              ? dp[i - 1][j]
              : dp[i][j - 1];
        }
      }
    }

    // Step 2: backtrack to build result
    int i = m, j = n;
    StringBuffer sb = StringBuffer();

    while (i > 0 && j > 0) {
      if (str1[i - 1] == str2[j - 1]) {
        sb.write(str1[i - 1]);
        i--;
        j--;
      } else if (dp[i - 1][j] > dp[i][j - 1]) {
        sb.write(str1[i - 1]);
        i--;
      } else {
        sb.write(str2[j - 1]);
        j--;
      }
    }

    // add remaining characters
    while (i > 0) {
      sb.write(str1[i - 1]);
      i--;
    }

    while (j > 0) {
      sb.write(str2[j - 1]);
      j--;
    }

    return sb.toString().split('').reversed.join();
  }
}