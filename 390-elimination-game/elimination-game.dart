class Solution {
  int lastRemaining(int n) {
    int head = 1;
    int step = 1;
    bool leftToRight = true;
    int remaining = n;

    while (remaining > 1) {
      if (leftToRight || remaining % 2 == 1) {
        head += step;
      }

      step *= 2;
      remaining ~/= 2;
      leftToRight = !leftToRight;
    }

    return head;
  }
}