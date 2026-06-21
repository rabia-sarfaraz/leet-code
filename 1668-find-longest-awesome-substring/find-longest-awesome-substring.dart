class Solution {
  int longestAwesome(String s) {
    Map<int, int> firstPos = {0: -1};
    int mask = 0;
    int ans = 0;

    for (int i = 0; i < s.length; i++) {
      int digit = s.codeUnitAt(i) - '0'.codeUnitAt(0);
      mask ^= (1 << digit);

      if (firstPos.containsKey(mask)) {
        ans = ans > i - firstPos[mask]! ? ans : i - firstPos[mask]!;
      } else {
        firstPos[mask] = i;
      }

      for (int b = 0; b < 10; b++) {
        int newMask = mask ^ (1 << b);
        if (firstPos.containsKey(newMask)) {
          ans = ans > i - firstPos[newMask]!
              ? ans
              : i - firstPos[newMask]!;
        }
      }
    }

    return ans;
  }
}