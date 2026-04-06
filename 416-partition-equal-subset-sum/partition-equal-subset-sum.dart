class Solution {
  bool canPartition(List<int> nums) {
    int sum = 0;

    for (int num in nums) {
      sum += num;
    }

    // If sum is odd, cannot split into two equal parts
    if (sum % 2 != 0) return false;

    int target = sum ~/ 2;

    List<bool> dp = List.filled(target + 1, false);
    dp[0] = true;

    for (int num in nums) {
      for (int j = target; j >= num; j--) {
        dp[j] = dp[j] || dp[j - num];
      }
    }

    return dp[target];
  }
}