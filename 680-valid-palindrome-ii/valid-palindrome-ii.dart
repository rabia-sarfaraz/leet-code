class Solution {
  bool validPalindrome(String s) {
    int l = 0;
    int r = s.length - 1;

    while (l < r) {
      if (s[l] == s[r]) {
        l++;
        r--;
      } else {
        return _isPal(s, l + 1, r) || _isPal(s, l, r - 1);
      }
    }

    return true;
  }

  bool _isPal(String s, int l, int r) {
    while (l < r) {
      if (s[l] != s[r]) return false;
      l++;
      r--;
    }
    return true;
  }
}