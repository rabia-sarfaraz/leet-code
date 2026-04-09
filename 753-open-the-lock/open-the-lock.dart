class Solution {
  int openLock(List<String> deadends, String target) {
    Set<String> dead = deadends.toSet();
    Set<String> visited = {};

    if (dead.contains("0000")) return -1;

    List<String> queue = ["0000"];
    visited.add("0000");

    int steps = 0;

    while (queue.isNotEmpty) {
      int size = queue.length;

      for (int i = 0; i < size; i++) {
        String cur = queue.removeAt(0);

        if (cur == target) return steps;

        for (String next in _neighbors(cur)) {
          if (!dead.contains(next) && !visited.contains(next)) {
            visited.add(next);
            queue.add(next);
          }
        }
      }

      steps++;
    }

    return -1;
  }

  List<String> _neighbors(String s) {
    List<String> res = [];

    for (int i = 0; i < 4; i++) {
      int digit = int.parse(s[i]);

      for (int move in [-1, 1]) {
        int newDigit = (digit + move + 10) % 10;

        String next = s.substring(0, i) +
            newDigit.toString() +
            s.substring(i + 1);

        res.add(next);
      }
    }

    return res;
  }
}