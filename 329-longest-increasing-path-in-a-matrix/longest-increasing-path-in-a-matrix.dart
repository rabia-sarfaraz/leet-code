class Solution {
  late List<List<int>> memo;
  late List<List<int>> matrix;
  late int m, n;

  int longestIncreasingPath(List<List<int>> mat) {
    matrix = mat;
    m = mat.length;
    n = mat[0].length;

    memo = List.generate(m, (_) => List.filled(n, 0));

    int ans = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        ans = ans > dfs(i, j) ? ans : dfs(i, j);
      }
    }

    return ans;
  }

  int dfs(int i, int j) {
    if (memo[i][j] != 0) return memo[i][j];

    List<List<int>> dirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    int best = 1;

    for (var d in dirs) {
      int ni = i + d[0];
      int nj = j + d[1];

      if (ni >= 0 &&
          nj >= 0 &&
          ni < m &&
          nj < n &&
          matrix[ni][nj] > matrix[i][j]) {
        best = best > (1 + dfs(ni, nj)) ? best : (1 + dfs(ni, nj));
      }
    }

    memo[i][j] = best;
    return best;
  }
}