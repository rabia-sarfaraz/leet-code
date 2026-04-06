class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < magazine.length; i++) {
      freq[magazine.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    for (int i = 0; i < ransomNote.length; i++) {
      int idx = ransomNote.codeUnitAt(i) - 'a'.codeUnitAt(0);

      freq[idx]--;
      if (freq[idx] < 0) {
        return false;
      }
    }

    return true;
  }
}