class Solution {
  int minFallingPathSum(List<List<int>> matrix) {
    int n = matrix.length;

    // copy first row as DP base
    List<List<int>> dp = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    for (int j = 0; j < n; j++) {
      dp[0][j] = matrix[0][j];
    }

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < n; j++) {
        int up = dp[i - 1][j];

        int leftDiag = j > 0 ? dp[i - 1][j - 1] : 1 << 30;
        int rightDiag = j < n - 1 ? dp[i - 1][j + 1] : 1 << 30;

        dp[i][j] = matrix[i][j] +
            [up, leftDiag, rightDiag].reduce((a, b) => a < b ? a : b);
      }
    }

    int ans = dp[n - 1].reduce((a, b) => a < b ? a : b);
    return ans;
  }
}