class BrowserHistory {
  List<String> history = [];
  int current = 0;

  BrowserHistory(String homepage) {
    history.add(homepage);
  }

  void visit(String url) {
    // remove forward history
    history = history.sublist(0, current + 1);

    history.add(url);
    current++;
  }

  String back(int steps) {
    current = (current - steps < 0)
        ? 0
        : current - steps;

    return history[current];
  }

  String forward(int steps) {
    current = (current + steps >= history.length)
        ? history.length - 1
        : current + steps;

    return history[current];
  }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory obj = BrowserHistory(homepage);
 * obj.visit(url);
 * String param2 = obj.back(steps);
 * String param3 = obj.forward(steps);
 */