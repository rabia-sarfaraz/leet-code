class Solution {
  int minimumTotal(List<List<int>> triangle) {
    int n = triangle.length;

    // Last row copy
    List<int> dp = List.from(triangle[n - 1]);

    for (int i = n - 2; i >= 0; i--) {
      for (int j = 0; j <= i; j++) {
        dp[j] = triangle[i][j] + (dp[j] < dp[j + 1] ? dp[j] : dp[j + 1]);
      }
    }

    return dp[0];
  }
}