class Solution {
  bool repeatedSubstringPattern(String s) {
    int n = s.length;

    for (int len = 1; len <= n ~/ 2; len++) {
      if (n % len != 0) continue;

      String pattern = s.substring(0, len);
      String built = "";

      for (int i = 0; i < n ~/ len; i++) {
        built += pattern;
      }

      if (built == s) return true;
    }

    return false;
  }
}