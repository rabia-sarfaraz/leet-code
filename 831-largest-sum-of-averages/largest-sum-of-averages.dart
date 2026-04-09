class Solution {
  double largestSumOfAverages(List<int> nums, int k) {
    int n = nums.length;

    // prefix sum
    List<double> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + nums[i];
    }

    // dp[i][j]
    List<List<double>> dp =
        List.generate(n + 1, (_) => List.filled(k + 1, 0));

    // base case: 1 group
    for (int i = 1; i <= n; i++) {
      dp[i][1] = prefix[i] / i;
    }

    for (int j = 2; j <= k; j++) {
      for (int i = j; i <= n; i++) {
        for (int p = j - 1; p < i; p++) {
          double avg = (prefix[i] - prefix[p]) / (i - p);
          dp[i][j] = dp[i][j] > (dp[p][j - 1] + avg)
              ? dp[i][j]
              : (dp[p][j - 1] + avg);
        }
      }
    }

    return dp[n][k];
  }
}