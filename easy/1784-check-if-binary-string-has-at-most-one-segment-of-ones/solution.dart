class Solution {
  bool checkOnesSegment(String s) {
    bool seenZero = false;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '0') {
        seenZero = true;
      } else if (seenZero) {
        return false;
      }
    }

    return true;
  }
}