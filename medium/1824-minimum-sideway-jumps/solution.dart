class Solution {
  int minSideJumps(List<int> obstacles) {
    // dp[0] = lane 1
    // dp[1] = lane 2
    // dp[2] = lane 3
    List<int> dp = [1, 0, 1];

    for (int i = 1; i < obstacles.length; i++) {
      int obstacle = obstacles[i];

      // Jis lane mein obstacle hai, wahan directly nahi ja sakte
      if (obstacle != 0) {
        dp[obstacle - 1] = 1000000;
      }

      // Side jump karke kisi doosri lane mein ja sakte hain
      for (int lane = 0; lane < 3; lane++) {
        if (obstacle == lane + 1) continue;

        int best = dp[lane];

        for (int other = 0; other < 3; other++) {
          if (other == lane) continue;
          if (obstacle == other + 1) continue;

          best = best < dp[other] + 1
              ? best
              : dp[other] + 1;
        }

        dp[lane] = best;
      }
    }

    return dp.reduce((a, b) => a < b ? a : b);
  }
}