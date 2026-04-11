class StockSpanner {
  List<List<int>> stack = []; // [price, span]

  StockSpanner();

  int next(int price) {
    int span = 1;

    while (stack.isNotEmpty && stack.last[0] <= price) {
      span += stack.last[1];
      stack.removeLast();
    }

    stack.add([price, span]);
    return span;
  }
}