import 'dart:collection';

class Solution {
  int findMaxValueOfEquation(List<List<int>> points, int k) {
    ListQueue<List<int>> dq = ListQueue();

    int ans = -1000000000;

    for (var p in points) {
      int x = p[0];
      int y = p[1];

      // remove invalid points
      while (dq.isNotEmpty && x - dq.first[1] > k) {
        dq.removeFirst();
      }

      // calculate maximum value
      if (dq.isNotEmpty) {
        ans = ans > x + y + dq.first[0]
            ? ans
            : x + y + dq.first[0];
      }

      int value = y - x;

      // maintain decreasing deque
      while (dq.isNotEmpty && dq.last[0] <= value) {
        dq.removeLast();
      }

      dq.addLast([value, x]);
    }

    return ans;
  }
}