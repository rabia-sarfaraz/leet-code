import 'dart:collection';
import 'package:collection/collection.dart';

class Solution {
  List<int> kthSmallestPrimeFraction(List<int> arr, int k) {
    int n = arr.length;

    var pq = HeapPriorityQueue<List<dynamic>>(
      (a, b) => (a[0] as double).compareTo(b[0] as double),
    );

    for (int j = 1; j < n; j++) {
      pq.add([arr[0] / arr[j], 0, j]);
    }

    for (int t = 1; t < k; t++) {
      var cur = pq.removeFirst();
      int i = cur[1];
      int j = cur[2];

      if (i + 1 < j) {
        pq.add([arr[i + 1] / arr[j], i + 1, j]);
      }
    }

    var ans = pq.removeFirst();
    return [arr[ans[1]], arr[ans[2]]];
  }
}