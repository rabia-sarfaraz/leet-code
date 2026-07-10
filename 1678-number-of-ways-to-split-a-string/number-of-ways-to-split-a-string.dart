class Solution {
  int numWays(String s) {
    const int MOD = 1000000007;
    int n = s.length;

    int ones = 0;
    for (int i = 0; i < n; i++) {
      if (s[i] == '1') ones++;
    }

    if (ones == 0) {
      int ways = (n - 1) * (n - 2) ~/ 2;
      return ways % MOD;
    }

    if (ones % 3 != 0) return 0;

    int k = ones ~/ 3;
    int cnt = 0;

    int firstEnd = -1, secondStart = -1;
    int secondEnd = -1, thirdStart = -1;

    for (int i = 0; i < n; i++) {
      if (s[i] == '1') {
        cnt++;
        if (cnt == k) firstEnd = i;
        if (cnt == k + 1 && secondStart == -1) secondStart = i;
        if (cnt == 2 * k) secondEnd = i;
        if (cnt == 2 * k + 1 && thirdStart == -1) thirdStart = i;
      }
    }

    int gap1 = secondStart - firstEnd;
    int gap2 = thirdStart - secondEnd;

    return ((gap1 * gap2) % MOD);
  }
}