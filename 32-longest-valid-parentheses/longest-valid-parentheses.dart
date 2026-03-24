class Solution {
  int longestValidParentheses(String s) {
    List<int> stack = [];
    stack.add(-1);

    int maxLen = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i);
      } else {
        stack.removeLast();

        if (stack.isEmpty) {
          stack.add(i);
        } else {
          int length = i - stack.last;
          if (length > maxLen) {
            maxLen = length;
          }
        }
      }
    }

    return maxLen;
  }
}