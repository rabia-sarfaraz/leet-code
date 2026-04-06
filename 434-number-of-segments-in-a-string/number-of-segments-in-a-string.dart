class Solution {
  int countSegments(String s) {
    int count = 0;
    bool inWord = false;

    for (int i = 0; i < s.length; i++) {
      if (s[i] != ' ') {
        if (!inWord) {
          count++;
          inWord = true;
        }
      } else {
        inWord = false;
      }
    }

    return count;
  }
}