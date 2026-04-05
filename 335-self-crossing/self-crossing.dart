class Solution {
  bool isSelfCrossing(List<int> x) {
    int n = x.length;
    if (n < 4) return false;

    for (int i = 3; i < n; i++) {

      // Case 1: current line crosses 3 steps back
      if (x[i] >= x[i - 2] && x[i - 1] <= x[i - 3]) {
        return true;
      }

      // Case 2: overlapping spiral (4-step check)
      if (i >= 4 &&
          x[i - 1] == x[i - 3] &&
          x[i] + x[i - 4] >= x[i - 2]) {
        return true;
      }

      // Case 3: complex spiral (5-step check)
      if (i >= 5 &&
          x[i - 1] <= x[i - 3] &&
          x[i - 2] > x[i - 4] &&
          x[i] + x[i - 4] >= x[i - 2] &&
          x[i - 1] + x[i - 5] >= x[i - 3]) {
        return true;
      }
    }

    return false;
  }
}