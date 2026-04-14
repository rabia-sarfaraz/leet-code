class Solution {
  int maxSatisfied(List<int> customers, List<int> grumpy, int minutes) {
    int n = customers.length;

    int base = 0; // always satisfied
    for (int i = 0; i < n; i++) {
      if (grumpy[i] == 0) {
        base += customers[i];
      }
    }

    int extra = 0;
    int maxExtra = 0;

    // first window
    for (int i = 0; i < minutes; i++) {
      if (grumpy[i] == 1) {
        extra += customers[i];
      }
    }

    maxExtra = extra;

    // sliding window
    for (int i = minutes; i < n; i++) {
      if (grumpy[i] == 1) extra += customers[i];
      if (grumpy[i - minutes] == 1) extra -= customers[i - minutes];

      maxExtra = maxExtra > extra ? maxExtra : extra;
    }

    return base + maxExtra;
  }
}