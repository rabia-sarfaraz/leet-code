class Solution {
  String minRemoveToMakeValid(String s) {
    List<String> stack = [];
    int open = 0;

    // first pass: remove invalid ')'
    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == '(') {
        open++;
        stack.add(ch);
      } else if (ch == ')') {
        if (open > 0) {
          open--;
          stack.add(ch);
        }
      } else {
        stack.add(ch);
      }
    }

    // second pass: remove extra '(' from right
    List<String> result = [];
    for (int i = stack.length - 1; i >= 0; i--) {
      if (stack[i] == '(' && open > 0) {
        open--;
        continue;
      }
      result.add(stack[i]);
    }

    return result.reversed.join();
  }
}