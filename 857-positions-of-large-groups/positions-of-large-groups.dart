class Solution {
  List<List<int>> largeGroupPositions(String s) {
    List<List<int>> res = [];
    int n = s.length;
    int start = 0;

    for (int i = 0; i < n; i++) {
      // end of group
      if (i == n - 1 || s[i] != s[i + 1]) {
        int length = i - start + 1;

        if (length >= 3) {
          res.add([start, i]);
        }

        start = i + 1;
      }
    }

    return res;
  }
}