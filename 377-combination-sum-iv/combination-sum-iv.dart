class Solution {
  int combinationSum4(List<int> nums, int target) {
    List<int> dp = List.filled(target + 1, 0);
    dp[0] = 1;

    for (int i = 1; i <= target; i++) {
      for (int num in nums) {
        if (i >= num) {
          dp[i] += dp[i - num];
        }
      }
    }

    return dp[target];
  }
}