class Solution {
  int numWays(int steps, int arrLen) {
    int mod = 1000000007;
    int maxPos = steps < arrLen ? steps : arrLen;

    List<int> dp = List.filled(maxPos, 0);
    dp[0] = 1;

    for (int i = 0; i < steps; i++) {
      List<int> newDp = List.filled(maxPos, 0);

      for (int j = 0; j < maxPos; j++) {
        if (dp[j] == 0) continue;

        // stay
        newDp[j] = (newDp[j] + dp[j]) % mod;

        // left
        if (j - 1 >= 0) {
          newDp[j - 1] = (newDp[j - 1] + dp[j]) % mod;
        }

        // right
        if (j + 1 < maxPos) {
          newDp[j + 1] = (newDp[j + 1] + dp[j]) % mod;
        }
      }

      dp = newDp;
    }

    return dp[0];
  }
}