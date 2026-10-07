class Solution {
  List<String> removeInvalidParentheses(String s) {
    List<String> result = [];
    Set<String> visited = {s};
    List<String> queue = [s];

    while (queue.isNotEmpty) {
      String current = queue.removeAt(0);

      if (_isValid(current)) {
        result.add(current);
      }

      // Agar current level par valid answer mil gaya,
      // to aur characters remove nahi karne.
      if (result.isNotEmpty) {
        continue;
      }

      for (int i = 0; i < current.length; i++) {
        if (current[i] != '(' && current[i] != ')') {
          continue;
        }

        String next =
            current.substring(0, i) + current.substring(i + 1);

        if (!visited.contains(next)) {
          visited.add(next);
          queue.add(next);
        }
      }
    }

    return result;
  }

  bool _isValid(String s) {
    int balance = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        balance++;
      } else if (s[i] == ')') {
        balance--;

        if (balance < 0) {
          return false;
        }
      }
    }

    return balance == 0;
  }
}