class Solution {
  int findTargetSumWays(List<int> nums, int target) {
    int sum = nums.fold(0, (a, b) => a + b);

    if (target.abs() > sum || (target + sum) % 2 != 0) {
      return 0;
    }

    int s = (target + sum) ~/ 2;

    List<int> dp = List.filled(s + 1, 0);
    dp[0] = 1;

    for (int num in nums) {
      for (int j = s; j >= num; j--) {
        dp[j] += dp[j - num];
      }
    }

    return dp[s];
  }
}