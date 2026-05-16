import 'dart:math';

class Solution {
  late List<int> balls;
  late List<List<double>> comb;

  double getProbability(List<int> balls) {
    this.balls = balls;

    int totalBalls = balls.reduce((a, b) => a + b);
    int half = totalBalls ~/ 2;

    // Precompute combinations
    comb = List.generate(
      totalBalls + 1,
      (_) => List.filled(totalBalls + 1, 0),
    );

    for (int n = 0; n <= totalBalls; n++) {
      comb[n][0] = 1;
      comb[n][n] = 1;

      for (int r = 1; r < n; r++) {
        comb[n][r] =
            comb[n - 1][r - 1] + comb[n - 1][r];
      }
    }

    double good = 0;
    double total = 0;

    void dfs(
      int idx,
      int count1,
      int count2,
      int distinct1,
      int distinct2,
      double ways,
    ) {
      if (count1 > half || count2 > half) {
        return;
      }

      if (idx == balls.length) {
        if (count1 == half && count2 == half) {
          total += ways;

          if (distinct1 == distinct2) {
            good += ways;
          }
        }
        return;
      }

      int ballCount = balls[idx];

      for (int i = 0; i <= ballCount; i++) {
        int j = ballCount - i;

        int newDistinct1 =
            distinct1 + (i > 0 ? 1 : 0);

        int newDistinct2 =
            distinct2 + (j > 0 ? 1 : 0);

        double newWays =
            ways *
            comb[ballCount][i];

        dfs(
          idx + 1,
          count1 + i,
          count2 + j,
          newDistinct1,
          newDistinct2,
          newWays,
        );
      }
    }

    dfs(0, 0, 0, 0, 0, 1);

    return good / total;
  }
}