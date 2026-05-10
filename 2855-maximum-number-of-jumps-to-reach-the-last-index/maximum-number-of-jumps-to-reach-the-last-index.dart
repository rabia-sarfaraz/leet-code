class Solution {
  int maximumJumps(List<int> nums, int target) {
    int n = nums.length;

    List<int> dp = List.filled(n, -1);
    dp[0] = 0;

    for (int i = 0; i < n; i++) {
      if (dp[i] == -1) continue;

      for (int j = i + 1; j < n; j++) {
        if ((nums[j] - nums[i]).abs() <= target) {
          dp[j] = dp[j] > dp[i] + 1 ? dp[j] : dp[i] + 1;
        }
      }
    }

    return dp[n - 1];
  }
}