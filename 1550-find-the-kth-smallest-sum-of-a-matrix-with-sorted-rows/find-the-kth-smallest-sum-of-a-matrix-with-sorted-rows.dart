import 'dart:collection';

class Solution {
  int kthSmallest(List<List<int>> mat, int k) {
    List<int> prev = [0];

    for (List<int> row in mat) {
      List<int> next = [];

      for (int base in prev) {
        for (int val in row) {
          next.add(base + val);
        }
      }

      next.sort();

      // keep only top k smallest sums
      if (next.length > k) {
        next = next.sublist(0, k);
      }

      prev = next;
    }

    return prev[k - 1];
  }
}