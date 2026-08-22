class Solution {
  int kthLargestValue(List<List<int>> matrix, int k) {
    int m = matrix.length;
    int n = matrix[0].length;

    List<int> values = [];

    List<List<int>> prefix =
        List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        prefix[i][j] =
            matrix[i - 1][j - 1] ^
            prefix[i - 1][j] ^
            prefix[i][j - 1] ^
            prefix[i - 1][j - 1];

        values.add(prefix[i][j]);
      }
    }

    values.sort((a, b) => b.compareTo(a));

    return values[k - 1];
  }
}