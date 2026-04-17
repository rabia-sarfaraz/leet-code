class Solution {
  String reverseParentheses(String s) {
    List<List<String>> stack = [[]];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == '(') {
        stack.add([]);
      } 
      else if (ch == ')') {
        List<String> top = stack.removeLast();
        top = top.reversed.toList();
        stack.last.addAll(top);
      } 
      else {
        stack.last.add(ch);
      }
    }

    return stack[0].join();
  }
}