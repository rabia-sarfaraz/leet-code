class Solution {
  int calPoints(List<String> operations) {
    List<int> stack = [];

    for (String op in operations) {
      if (op == "C") {
        stack.removeLast();
      } else if (op == "D") {
        stack.add(stack.last * 2);
      } else if (op == "+") {
        int last = stack.last;
        int secondLast = stack[stack.length - 2];
        stack.add(last + secondLast);
      } else {
        stack.add(int.parse(op));
      }
    }

    int sum = 0;
    for (int x in stack) {
      sum += x;
    }

    return sum;
  }
}