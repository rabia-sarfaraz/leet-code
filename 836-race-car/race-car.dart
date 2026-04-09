class Solution {
  Map<int, int> memo = {};

  int racecar(int target) {
    if (memo.containsKey(target)) return memo[target]!;

    int k = 1;
    while ((1 << k) - 1 < target) {
      k++;
    }

    // exact match
    if ((1 << k) - 1 == target) {
      return memo[target] = k;
    }

    // case 1: overshoot then reverse
    int res = k + 1 + racecar((1 << k) - 1 - target);

    // case 2: undershoot and reverse before reaching
    for (int m = 0; m < k - 1; m++) {
      int dist = (1 << (k - 1)) - 1 - ((1 << m) - 1);
      res = res < (k - 1 + 1 + m + 1 + racecar(target - dist))
          ? res
          : (k - 1 + 1 + m + 1 + racecar(target - dist));
    }

    memo[target] = res;
    return res;
  }
}