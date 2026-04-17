class Solution {
  int equalSubstring(String s, String t, int maxCost) {
    int left = 0;
    int cost = 0;
    int maxLen = 0;

    for (int right = 0; right < s.length; right++) {
      cost += (s.codeUnitAt(right) - t.codeUnitAt(right)).abs();

      while (cost > maxCost) {
        cost -= (s.codeUnitAt(left) - t.codeUnitAt(left)).abs();
        left++;
      }

      maxLen = maxLen > (right - left + 1) ? maxLen : (right - left + 1);
    }

    return maxLen;
  }
}