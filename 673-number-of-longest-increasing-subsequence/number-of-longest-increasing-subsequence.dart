class Solution {
  int findNumberOfLIS(List<int> nums) {
    int n = nums.length;
    if (n == 0) return 0;

    List<int> dp = List.filled(n, 1);     // LIS length
    List<int> count = List.filled(n, 1);  // number of LIS

    int maxLen = 1;
    int result = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] > nums[j]) {
          if (dp[j] + 1 > dp[i]) {
            dp[i] = dp[j] + 1;
            count[i] = count[j];
          } else if (dp[j] + 1 == dp[i]) {
            count[i] += count[j];
          }
        }
      }

      if (dp[i] > maxLen) {
        maxLen = dp[i];
        result = count[i];
      } else if (dp[i] == maxLen) {
        result += count[i];
      }
    }

    return result;
  }
}