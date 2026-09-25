class Solution {
  List<String> braceExpansionII(String expression) {
    Set<String> result = _dfs(expression, 0, expression.length - 1);
    List<String> ans = result.toList();
    ans.sort();
    return ans;
  }

  Set<String> _dfs(String s, int start, int end) {
    List<Set<String>> groups = [<String>{}];

    // Current concatenation group
    Set<String> current = {""};

    int level = 0;
    int braceStart = -1;

    for (int i = start; i <= end; i++) {
      String c = s[i];

      if (c == '{') {
        if (level == 0) {
          braceStart = i + 1;
        }
        level++;
      } else if (c == '}') {
        level--;

        if (level == 0) {
          Set<String> inside = _dfs(s, braceStart, i - 1);
          current = _multiply(current, inside);
        }
      } else if (c == ',' && level == 0) {
        groups[groups.length - 1].addAll(current);
        groups.add(<String>{});
        current = {""};
      } else if (level == 0) {
        current = _multiply(current, {c});
      }
    }

    groups[groups.length - 1].addAll(current);

    Set<String> result = {};
    for (Set<String> group in groups) {
      result.addAll(group);
    }

    return result;
  }

  Set<String> _multiply(Set<String> a, Set<String> b) {
    Set<String> result = {};

    for (String x in a) {
      for (String y in b) {
        result.add(x + y);
      }
    }

    return result;
  }
}