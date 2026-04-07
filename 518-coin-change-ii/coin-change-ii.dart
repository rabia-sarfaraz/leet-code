class Solution {
  int change(int amount, List<int> coins) {
    List<int> dp = List.filled(amount + 1, 0);
    dp[0] = 1;

    for (int coin in coins) {
      for (int i = coin; i <= amount; i++) {
        dp[i] += dp[i - coin];
      }
    }

    return dp[amount];
  }
}