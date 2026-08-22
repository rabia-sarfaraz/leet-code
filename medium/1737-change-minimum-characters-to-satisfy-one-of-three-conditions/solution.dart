class Solution {
  int minCharacters(String a, String b) {
    List<int> countA = List.filled(26, 0);
    List<int> countB = List.filled(26, 0);

    for (int i = 0; i < a.length; i++) {
      countA[a.codeUnitAt(i) - 97]++;
    }

    for (int i = 0; i < b.length; i++) {
      countB[b.codeUnitAt(i) - 97]++;
    }

    int ans = a.length + b.length;

    // Conditions 1 and 2
    for (int i = 0; i < 25; i++) {
      int aGreater = 0;
      int bGreater = 0;

      for (int j = i + 1; j < 26; j++) {
        aGreater += countA[j];
        bGreater += countB[j];
      }

      int aLessOrEqual = a.length - aGreater;
      int bLessOrEqual = b.length - bGreater;

      // Every character in a < every character in b
      // a: <= i, b: > i
      int change1 = aGreater + bLessOrEqual;

      // Every character in b < every character in a
      // b: <= i, a: > i
      int change2 = bGreater + aLessOrEqual;

      ans = ans < change1 ? ans : change1;
      ans = ans < change2 ? ans : change2;
    }

    // Condition 3:
    // Both strings contain only one same character
    for (int i = 0; i < 26; i++) {
      int changes =
          (a.length - countA[i]) +
          (b.length - countB[i]);

      ans = ans < changes ? ans : changes;
    }

    return ans;
  }
}