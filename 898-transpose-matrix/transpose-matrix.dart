class Solution {
  List<List<int>> transpose(List<List<int>> matrix) {
    int n = matrix.length;
    int m = matrix[0].length;

    List<List<int>> ans = List.generate(
      m,
      (_) => List.filled(n, 0),
    );

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        ans[j][i] = matrix[i][j];
      }
    }

    return ans;
  }
}