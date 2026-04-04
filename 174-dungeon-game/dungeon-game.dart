
class Solution {
  int calculateMinimumHP(List<List<int>> dungeon) {
    int m = dungeon.length;
    int n = dungeon[0].length;

    List<List<int>> dp = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 1 << 30),
    );

    dp[m][n - 1] = 1;
    dp[m - 1][n] = 1;

    for (int i = m - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        int minNext = (dp[i + 1][j] < dp[i][j + 1])
            ? dp[i + 1][j]
            : dp[i][j + 1];

        dp[i][j] = (minNext - dungeon[i][j] <= 0)
            ? 1
            : minNext - dungeon[i][j];
      }
    }

    return dp[0][0];
  }
}