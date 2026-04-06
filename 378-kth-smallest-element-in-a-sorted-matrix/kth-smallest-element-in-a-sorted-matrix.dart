import 'package:collection/collection.dart';

class Solution {
  int kthSmallest(List<List<int>> matrix, int k) {
    int n = matrix.length;

    PriorityQueue<List<int>> pq = PriorityQueue(
      (a, b) => a[0].compareTo(b[0]),
    );

    // first column push
    for (int r = 0; r < n; r++) {
      pq.add([matrix[r][0], r, 0]);
    }

    int ans = 0;

    for (int i = 0; i < k; i++) {
      var cur = pq.removeFirst();
      int val = cur[0];
      int r = cur[1];
      int c = cur[2];

      ans = val;

      if (c + 1 < n) {
        pq.add([matrix[r][c + 1], r, c + 1]);
      }
    }

    return ans;
  }
}