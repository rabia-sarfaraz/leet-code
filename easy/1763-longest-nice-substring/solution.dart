class Solution {
  String longestNiceSubstring(String s) {
    if (s.length < 2) return '';

    Set<String> chars = s.split('').toSet();

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (!chars.contains(c.toLowerCase()) ||
          !chars.contains(c.toUpperCase())) {
        String left = longestNiceSubstring(s.substring(0, i));
        String right = longestNiceSubstring(s.substring(i + 1));

        return left.length >= right.length ? left : right;
      }
    }

    return s;
  }
}