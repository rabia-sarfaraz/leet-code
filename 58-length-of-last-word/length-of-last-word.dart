class Solution {
  int lengthOfLastWord(String s) {
    int i = s.length - 1;
    int length = 0;

    // skip trailing spaces
    while (i >= 0 && s[i] == ' ') {
      i--;
    }

    // count last word
    while (i >= 0 && s[i] != ' ') {
      length++;
      i--;
    }

    return length;
  }
}