class Solution {
  int findKthNumber(int n, int k) {
    int curr = 1;
    k--; // we start from 1

    while (k > 0) {
      int steps = _countSteps(n, curr, curr + 1);

      if (steps <= k) {
        // move to next sibling
        curr++;
        k -= steps;
      } else {
        // go deeper in this prefix tree
        curr *= 10;
        k--;
      }
    }

    return curr;
  }

  int _countSteps(int n, int curr, int next) {
    int steps = 0;

    while (curr <= n) {
      steps += (next <= n + 1 ? next : n + 1) - curr;
      curr *= 10;
      next *= 10;
    }

    return steps;
  }
}