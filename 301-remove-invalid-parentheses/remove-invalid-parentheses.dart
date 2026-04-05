import 'dart:collection';
class Solution {
  List<String> removeInvalidParentheses(String s) {
    List<String> result = [];
    Set<String> visited = {};
    Queue<String> queue = Queue();

    queue.add(s);
    visited.add(s);

    bool found = false;

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();

      if (isValid(current)) {
        result.add(current);
        found = true;
      }

      if (found) continue;

      for (int i = 0; i < current.length; i++) {
        if (current[i] != '(' && current[i] != ')') continue;

        String next = current.substring(0, i) + current.substring(i + 1);

        if (!visited.contains(next)) {
          queue.add(next);
          visited.add(next);
        }
      }
    }

    return result;
  }

  bool isValid(String s) {
    int count = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        count++;
      } else if (s[i] == ')') {
        count--;
        if (count < 0) return false;
      }
    }

    return count == 0;
  }
}