class MyStack {
  List<int> q = [];

  MyStack();

  void push(int x) {
    q.add(x);

    // rotate to make last element front
    for (int i = 0; i < q.length - 1; i++) {
      q.add(q.removeAt(0));
    }
  }

  int pop() {
    return q.removeAt(0);
  }

  int top() {
    return q[0];
  }

  bool empty() {
    return q.isEmpty;
  }
}