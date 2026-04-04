class Solution {
  int evalRPN(List<String> tokens) {
    List<int> stack = [];

    for (String t in tokens) {
      if (t == "+" || t == "-" || t == "*" || t == "/") {
        int b = stack.removeLast();
        int a = stack.removeLast();

        int res;

        if (t == "+") {
          res = a + b;
        } else if (t == "-") {
          res = a - b;
        } else if (t == "*") {
          res = a * b;
        } else {
          res = a ~/ b; // integer division (truncate toward zero)
        }

        stack.add(res);
      } else {
        stack.add(int.parse(t));
      }
    }

    return stack.last;
  }
}