class MyQueue {
  List<int> inStack = [];
  List<int> outStack = [];

  MyQueue();

  void push(int x) {
    inStack.add(x);
  }

  void _move() {
    if (outStack.isEmpty) {
      while (inStack.isNotEmpty) {
        outStack.add(inStack.removeLast());
      }
    }
  }

  int pop() {
    _move();
    return outStack.removeLast();
  }

  int peek() {
    _move();
    return outStack.last;
  }

  bool empty() {
    return inStack.isEmpty && outStack.isEmpty;
  }
}