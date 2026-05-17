import 'dart:collection';

class Solution {
  int findMaxValueOfEquation(List<List<int>> points, int k) {
    // deque stores [value = yi - xi, xi]
    ListQueue<List<int>> dq = ListQueue();

    int ans = -1 << 30;

    for (var p in points) {
      int x = p[0];
      int y = p[1];

      // remove points where xj - xi > k
      while (dq.isNotEmpty && x - dq.first[1] > k) {
        dq.removeFirst();
      }

      // calculate answer
      if (dq.isNotEmpty) {
        ans = ans > x + y + dq.first[0]
            ? ans
            : x + y + dq.first[0];
      }

      int value = y - x;

      // maintain decreasing order
      while (dq.isNotEmpty && dq.last[0] <= value) {
        dq.removeLast();
      }

      dq.addLast([value, x]);
    }

    return ans;
  }
}