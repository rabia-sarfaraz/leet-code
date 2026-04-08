class Solution {
  int flipLights(int n, int presses) {
    if (presses == 0) return 1;
    if (n == 0) return 0;

    n = n > 3 ? 3 : n;

    Set<int> seen = <int>{};
    List<int> states = <int>{0}.toList(); // all bulbs ON initially (111... simplified)

    for (int i = 0; i < presses; i++) {
      Set<int> next = <int>{};

      for (int state in states) {
        next.add(_op1(state, n));
        next.add(_op2(state, n));
        next.add(_op3(state, n));
        next.add(_op4(state, n));
      }

      states = next.toList();
    }

    return states.toSet().length;
  }

  int _op1(int s, int n) {
    // flip all
    return s ^ ((1 << n) - 1);
  }

  int _op2(int s, int n) {
    // flip even
    int mask = 0;
    for (int i = 0; i < n; i++) {
      if ((i + 1) % 2 == 0) mask |= (1 << i);
    }
    return s ^ mask;
  }

  int _op3(int s, int n) {
    // flip odd
    int mask = 0;
    for (int i = 0; i < n; i++) {
      if ((i + 1) % 2 == 1) mask |= (1 << i);
    }
    return s ^ mask;
  }

  int _op4(int s, int n) {
    // flip 1 + 3 + 5...
    int mask = 0;
    for (int i = 0; i < n; i += 3) {
      mask |= (1 << i);
    }
    return s ^ mask;
  }
}