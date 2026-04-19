class Solution {
  List<List<int>> diagonalSort(List<List<int>> mat) {
    int m = mat.length;
    int n = mat[0].length;

    Map<int, List<int>> diag = {};

    // Step 1: collect elements
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int key = i - j;
        diag.putIfAbsent(key, () => []);
        diag[key]!.add(mat[i][j]);
      }
    }

    // Step 2: sort each diagonal (descending for easy pop)
    for (var key in diag.keys) {
      diag[key]!.sort((a, b) => b.compareTo(a));
    }

    // Step 3: place back
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int key = i - j;
        mat[i][j] = diag[key]!.removeLast();
      }
    }

    return mat;
  }
}