class Solution {
  bool queryString(String s, int n) {
    for (int i = 1; i <= n; i++) {
      String bin = i.toRadixString(2);
      if (!s.contains(bin)) {
        return false;
      }
    }
    return true;
  }
}