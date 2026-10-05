class Solution {
  int scoreOfParentheses(String s) {
    List<int> stack = [0];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(0);
      } else {
        int inner = stack.removeLast();

        int score = inner == 0 ? 1 : 2 * inner;

        stack[stack.length - 1] += score;
      }
    }

    return stack[0];
  }
}