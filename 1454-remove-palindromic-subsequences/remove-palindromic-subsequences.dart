class Solution {
  int removePalindromeSub(String s) {
    if (s.isEmpty) return 0;

    // check if palindrome
    int i = 0, j = s.length - 1;
    while (i < j) {
      if (s[i] != s[j]) {
        return 2;
      }
      i++;
      j--;
    }

    return 1;
  }
}