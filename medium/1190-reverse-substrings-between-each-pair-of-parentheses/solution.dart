class Solution {
  String reverseParentheses(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == ')') {
        List<String> temp = [];

        while (stack.isNotEmpty && stack.last != '(') {
          temp.add(stack.removeLast());
        }

        // '(' remove karo
        stack.removeLast();

        // Reversed part wapas stack mein
        stack.addAll(temp);
      } else {
        stack.add(ch);
      }
    }

    return stack.join();
  }
}