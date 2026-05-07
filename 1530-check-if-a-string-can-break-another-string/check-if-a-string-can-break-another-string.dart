class Solution {
  bool checkIfCanBreak(String s1, String s2) {
    List<int> a = List.from(s1.codeUnits)..sort();
    List<int> b = List.from(s2.codeUnits)..sort();

    bool canBreak(List<int> x, List<int> y) {
      for (int i = 0; i < x.length; i++) {
        if (x[i] < y[i]) return false;
      }
      return true;
    }

    return canBreak(a, b) || canBreak(b, a);
  }
}