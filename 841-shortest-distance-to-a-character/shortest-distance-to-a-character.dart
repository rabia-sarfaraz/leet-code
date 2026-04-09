class Solution {
  List<int> shortestToChar(String s, String c) {
    int n = s.length;
    List<int> res = List.filled(n, 100000);

    // left to right
    int prev = -100000;
    for (int i = 0; i < n; i++) {
      if (s[i] == c) {
        prev = i;
      }
      res[i] = i - prev;
    }

    // right to left
    prev = 100000;
    for (int i = n - 1; i >= 0; i--) {
      if (s[i] == c) {
        prev = i;
      }
      int dist = prev - i;
      if (dist < res[i]) {
        res[i] = dist;
      }
    }

    return res;
  }
}