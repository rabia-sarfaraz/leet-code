class Solution {
  int maxDotProduct(List<int> nums1, List<int> nums2) {
    int n = nums1.length;
    int m = nums2.length;

    List<List<int>> dp = List.generate(
      n + 1,
      (_) => List.filled(m + 1, -1000000000),
    );

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        int product = nums1[i - 1] * nums2[j - 1];

        dp[i][j] = [
          product,
          product + (dp[i - 1][j - 1] > 0 ? dp[i - 1][j - 1] : 0),
          dp[i - 1][j],
          dp[i][j - 1]
        ].reduce((a, b) => a > b ? a : b);
      }
    }

    return dp[n][m];
  }
}