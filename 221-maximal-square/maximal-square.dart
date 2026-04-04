class Solution {
  int maximalSquare(List<List<String>> matrix) {
    if (matrix.isEmpty || matrix[0].isEmpty) return 0;

    int rows = matrix.length;
    int cols = matrix[0].length;

    List<List<int>> dp =
        List.generate(rows, (_) => List.filled(cols, 0));

    int maxSide = 0;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (matrix[i][j] == '1') {
          if (i == 0 || j == 0) {
            dp[i][j] = 1;
          } else {
            dp[i][j] = 1 +
                [
                  dp[i - 1][j],
                  dp[i][j - 1],
                  dp[i - 1][j - 1]
                ].reduce((a, b) => a < b ? a : b);
          }

          if (dp[i][j] > maxSide) {
            maxSide = dp[i][j];
          }
        }
      }
    }

    return maxSide * maxSide; // ✅ guaranteed return
  }
}