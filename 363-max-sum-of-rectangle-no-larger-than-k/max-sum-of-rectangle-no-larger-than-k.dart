import 'dart:collection';

class Solution {
  int maxSumSubmatrix(List<List<int>> matrix, int k) {
    int m = matrix.length;
    int n = matrix[0].length;
    int result = -1000000000;

    for (int top = 0; top < m; top++) {
      List<int> colSum = List.filled(n, 0);

      for (int bottom = top; bottom < m; bottom++) {
        for (int c = 0; c < n; c++) {
          colSum[c] += matrix[bottom][c];
        }

        // find max subarray sum <= k
        Set<int> prefixSet = SplayTreeSet();
        prefixSet.add(0);

        int prefix = 0;

        for (int x in colSum) {
          prefix += x;

          // we need smallest prefix >= prefix - k
          var it = prefixSet.where((v) => v >= prefix - k);

          if (it.isNotEmpty) {
            result = result > (prefix - it.first) ? result : (prefix - it.first);
          }

          prefixSet.add(prefix);
        }
      }
    }

    return result;
  }
}