class Solution {
  int lastStoneWeightII(List<int> stones) {
    int sum = stones.reduce((a, b) => a + b);
    int target = sum ~/ 2;

    List<bool> dp = List.filled(target + 1, false);
    dp[0] = true;

    for (int stone in stones) {
      for (int j = target; j >= stone; j--) {
        dp[j] = dp[j] || dp[j - stone];
      }
    }

    for (int j = target; j >= 0; j--) {
      if (dp[j]) {
        return sum - 2 * j;
      }
    }

    return 0;
  }
}