class Solution {
  int minOperations(String s) {
    int changeStart0 = 0;
    int changeStart1 = 0;

    for (int i = 0; i < s.length; i++) {
      // Pattern: 010101...
      String expected0 = (i % 2 == 0) ? '0' : '1';

      // Pattern: 101010...
      String expected1 = (i % 2 == 0) ? '1' : '0';

      if (s[i] != expected0) {
        changeStart0++;
      }

      if (s[i] != expected1) {
        changeStart1++;
      }
    }

    return changeStart0 < changeStart1
        ? changeStart0
        : changeStart1;
  }
}