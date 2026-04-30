class Solution {
  String longestPrefix(String s) {
    int n = s.length;
    List<int> lps = List.filled(n, 0);

    int len = 0; // length of previous longest prefix suffix
    int i = 1;

    while (i < n) {
      if (s[i] == s[len]) {
        len++;
        lps[i] = len;
        i++;
      } else {
        if (len != 0) {
          len = lps[len - 1];
        } else {
          lps[i] = 0;
          i++;
        }
      }
    }

    return s.substring(0, lps[n - 1]);
  }
}