class Solution {
  int numSubmatrixSumTarget(List<List<int>> matrix, int target) {
    int n = matrix.length;
    int m = matrix[0].length;
    int result = 0;

    for (int top = 0; top < n; top++) {
      List<int> colSum = List.filled(m, 0);

      for (int bottom = top; bottom < n; bottom++) {
        for (int c = 0; c < m; c++) {
          colSum[c] += matrix[bottom][c];
        }

        Map<int, int> map = {0: 1};
        int prefix = 0;

        for (int val in colSum) {
          prefix += val;

          if (map.containsKey(prefix - target)) {
            result += map[prefix - target]!;
          }

          map[prefix] = (map[prefix] ?? 0) + 1;
        }
      }
    }

    return result;
  }
}