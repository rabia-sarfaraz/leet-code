class MinStack {
  List<int> stack = [];
  List<int> minStack = [];

  MinStack();

  void push(int val) {
    stack.add(val);

    if (minStack.isEmpty || val <= minStack.last) {
      minStack.add(val);
    }
  }

  void pop() {
    if (stack.isEmpty) return;

    int removed = stack.removeLast();

    if (minStack.isNotEmpty && removed == minStack.last) {
      minStack.removeLast();
    }
  }

  int top() {
    if (stack.isEmpty) return -1; // safe fallback
    return stack.last;
  }

  int getMin() {
    if (minStack.isEmpty) return -1; // safe fallback
    return minStack.last;
  }
}