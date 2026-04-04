class Solution {
  int calculate(String s) {
    List<int> stack = [];
    int result = 0;
    int num = 0;
    int sign = 1;

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      // build number
      if (c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57) {
        num = num * 10 + (c.codeUnitAt(0) - 48);
      }

      // +
      else if (c == '+') {
        result += sign * num;
        num = 0;
        sign = 1;
      }

      // -
      else if (c == '-') {
        result += sign * num;
        num = 0;
        sign = -1;
      }

      // (
      else if (c == '(') {
        stack.add(result);
        stack.add(sign);
        result = 0;
        sign = 1;
      }

      // )
      else if (c == ')') {
        result += sign * num;
        num = 0;

        result *= stack.removeLast(); // sign
        result += stack.removeLast(); // previous result
      }
    }

    result += sign * num;

    return result;
  }
}