class Solution {
  int calculate(String s) {
    List<int> stack = [];
    int num = 0;
    String op = '+';

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      // build number
      if (c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57) {
        num = num * 10 + (c.codeUnitAt(0) - 48);
      }

      // operator or end of string
      if ((c != ' ' && (c == '+' || c == '-' || c == '*' || c == '/')) ||
          i == s.length - 1) {

        if (op == '+') {
          stack.add(num);
        } 
        else if (op == '-') {
          stack.add(-num);
        } 
        else if (op == '*') {
          stack[stack.length - 1] = stack.last * num;
        } 
        else if (op == '/') {
          stack[stack.length - 1] = stack.last ~/ num;
        }

        op = c;
        num = 0;
      }
    }

    int result = 0;
    for (int n in stack) {
      result += n;
    }

    return result;
  }
}