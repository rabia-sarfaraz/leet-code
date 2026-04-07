class Solution {
  bool predictTheWinner(List<int> nums) {
    int n = nums.length;
    List<List<int>> dp = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    for (int i = 0; i < n; i++) {
      dp[i][i] = nums[i];
    }

    for (int len = 2; len <= n; len++) {
      for (int i = 0; i <= n - len; i++) {
        int j = i + len - 1;

        dp[i][j] = [
          nums[i] - dp[i + 1][j],
          nums[j] - dp[i][j - 1]
        ].reduce((a, b) => a > b ? a : b);
      }
    }

    return dp[0][n - 1] >= 0;
  }
}