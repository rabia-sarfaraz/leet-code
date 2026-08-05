import 'dart:collection';

class Solution {
  String findLexSmallestString(String s, int a, int b) {
    Queue<String> q = Queue();
    Set<String> vis = {};

    q.add(s);
    vis.add(s);

    String ans = s;
    int n = s.length;

    while (q.isNotEmpty) {
      String cur = q.removeFirst();

      if (cur.compareTo(ans) < 0) ans = cur;

      // Operation 1: Add a to odd indices
      List<String> chars = cur.split('');
      for (int i = 1; i < n; i += 2) {
        int d = (int.parse(chars[i]) + a) % 10;
        chars[i] = d.toString();
      }
      String addStr = chars.join();
      if (vis.add(addStr)) {
        q.add(addStr);
      }

      // Operation 2: Rotate right by b
      String rot = cur.substring(n - b) + cur.substring(0, n - b);
      if (vis.add(rot)) {
        q.add(rot);
      }
    }

    return ans;
  }
}