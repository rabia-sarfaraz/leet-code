class Solution {
  int numRollsToTarget(int n, int k, int target) {
    const mod = 1000000007;

    List<int> dp = List.filled(target + 1, 0);
    dp[0] = 1;

    for (int dice = 1; dice <= n; dice++) {
      List<int> newDp = List.filled(target + 1, 0);

      for (int t = 1; t <= target; t++) {
        for (int face = 1; face <= k; face++) {
          if (t - face >= 0) {
            newDp[t] = (newDp[t] + dp[t - face]) % mod;
          }
        }
      }

      dp = newDp;
    }

    return dp[target];
  }
}