class Solution {
  String minWindow(String s, String t) {
    if (s.isEmpty || t.isEmpty) return "";

    Map<String, int> tMap = {};
    for (int i = 0; i < t.length; i++) {
      String c = t[i];
      tMap[c] = (tMap[c] ?? 0) + 1;
    }

    int required = tMap.length;
    int formed = 0;

    Map<String, int> windowMap = {};

    int left = 0, right = 0;

    int minLen = 1 << 30; // large number
    int start = 0;

    while (right < s.length) {
      String c = s[right];
      windowMap[c] = (windowMap[c] ?? 0) + 1;

      if (tMap.containsKey(c) && windowMap[c] == tMap[c]) {
        formed++;
      }

      // shrink window
      while (left <= right && formed == required) {
        String ch = s[left];

        if (right - left + 1 < minLen) {
          minLen = right - left + 1;
          start = left;
        }

        windowMap[ch] = windowMap[ch]! - 1;

        if (tMap.containsKey(ch) && windowMap[ch]! < tMap[ch]!) {
          formed--;
        }

        left++;
      }

      right++;
    }

    return minLen == (1 << 30)
        ? ""
        : s.substring(start, start + minLen);
  }
}