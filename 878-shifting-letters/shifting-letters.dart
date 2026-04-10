class Solution {
  String shiftingLetters(String s, List<int> shifts) {
    int n = s.length;

    List<int> res = List.filled(n, 0);
    int total = 0;

    // suffix sum
    for (int i = n - 1; i >= 0; i--) {
      total = (total + shifts[i]) % 26;
      res[i] = total;
    }

    // make a mutable copy
    List<int> chars = s.codeUnits.toList();

    for (int i = 0; i < n; i++) {
      int shifted = ((chars[i] - 97 + res[i]) % 26) + 97;
      chars[i] = shifted;
    }

    return String.fromCharCodes(chars);
  }
}