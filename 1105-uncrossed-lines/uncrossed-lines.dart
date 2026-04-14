class Solution {
  int maxUncrossedLines(List<int> nums1, List<int> nums2) {
    int n = nums1.length;
    int m = nums2.length;

    List<List<int>> dp = List.generate(
      n + 1,
      (_) => List.filled(m + 1, 0),
    );

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (nums1[i - 1] == nums2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
        } else {
          dp[i][j] =
              dp[i - 1][j] > dp[i][j - 1]
                  ? dp[i - 1][j]
                  : dp[i][j - 1];
        }
      }
    }

    return dp[n][m];
  }
}