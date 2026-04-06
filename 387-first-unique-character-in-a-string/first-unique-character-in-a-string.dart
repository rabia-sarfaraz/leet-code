class Solution {
  int firstUniqChar(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    for (int i = 0; i < s.length; i++) {
      if (freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] == 1) {
        return i;
      }
    }

    return -1;
  }
}