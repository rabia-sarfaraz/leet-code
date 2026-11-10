
class Solution {
  int climbStairs(int n, List<int> costs) {
    List<int> dp = List<int>.filled(n + 1, 1 << 60);

    dp[0] = 0;

    for (int i = 1; i <= n; i++) {
      for (int j = i - 1; j >= 0 && j >= i - 3; j--) {
        int jump = i - j;

        int currentCost =
            dp[j] + costs[i - 1] + jump * jump;

        if (currentCost < dp[i]) {
          dp[i] = currentCost;
        }
      }
    }

    return dp[n];
  }
}
