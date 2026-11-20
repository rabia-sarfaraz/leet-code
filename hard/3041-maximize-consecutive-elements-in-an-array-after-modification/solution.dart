import 'dart:math';

class Solution {
  int maxSelectedElements(List<int> nums) {
    nums.sort();
    Map<int, int> dp = {};
    int maxLen = 0;

    for (int num in nums) {
      // Pehle num + 1 update karein, phir num (taake same element double count na ho)
      dp[num + 1] = (dp[num] ?? 0) + 1;
      dp[num] = (dp[num - 1] ?? 0) + 1;

      maxLen = max(maxLen, max(dp[num]!, dp[num + 1]!));
    }

    return maxLen;
  }
}