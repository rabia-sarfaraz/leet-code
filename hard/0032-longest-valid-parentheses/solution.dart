class Solution {
  int longestValidParentheses(String s) {
    List<int> stack = [-1];
    int maxLength = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i);
      } else {
        stack.removeLast();

        if (stack.isEmpty) {
          // Invalid ')' ki new boundary
          stack.add(i);
        } else {
          int length = i - stack.last;
          if (length > maxLength) {
            maxLength = length;
          }
        }
      }
    }

    return maxLength;
  }
}