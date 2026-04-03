class Solution {
  bool isPalindrome(String s) {
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      // skip non-alphanumeric
      while (left < right && !_isAlphaNum(s[left])) {
        left++;
      }
      while (left < right && !_isAlphaNum(s[right])) {
        right--;
      }

      if (s[left].toLowerCase() != s[right].toLowerCase()) {
        return false;
      }

      left++;
      right--;
    }

    return true;
  }

  bool _isAlphaNum(String c) {
    int code = c.codeUnitAt(0);
    return (code >= 48 && code <= 57) ||   // 0-9
           (code >= 65 && code <= 90) ||   // A-Z
           (code >= 97 && code <= 122);    // a-z
  }
}