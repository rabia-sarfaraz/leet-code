class Solution {
  int rotatedDigits(int n) {
    Set<int> valid = {0, 1, 2, 5, 6, 8, 9};
    Set<int> good = {2, 5, 6, 9};

    bool isGood(int x) {
      bool changed = false;

      while (x > 0) {
        int d = x % 10;

        if (!valid.contains(d)) return false;
        if (good.contains(d)) changed = true;

        x ~/= 10;
      }

      return changed;
    }

    int count = 0;

    for (int i = 1; i <= n; i++) {
      if (isGood(i)) count++;
    }

    return count;
  }
}