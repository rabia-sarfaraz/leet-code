class Solution {
  int clumsy(int n) {
    List<int> stack = [n];
    int op = 0; // 0=*, 1=/, 2=+, 3=-

    for (int i = n - 1; i > 0; i--) {
      if (op == 0) {
        stack.last = stack.last * i;
      } else if (op == 1) {
        stack.last = stack.last ~/ i; // integer division
      } else if (op == 2) {
        stack.add(i);
      } else {
        stack.add(-i);
      }

      op = (op + 1) % 4;
    }

    // sum all values
    int result = 0;
    for (int num in stack) {
      result += num;
    }

    return result;
  }
}