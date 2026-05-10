class Solution {
  int maxPower(String s) {
    int maxLen = 1;
    int curr = 1;

    for (int i = 1; i < s.length; i++) {
      if (s[i] == s[i - 1]) {
        curr++;
      } else {
        curr = 1;
      }

      if (curr > maxLen) {
        maxLen = curr;
      }
    }

    return maxLen;
  }
}