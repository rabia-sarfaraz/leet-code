class Solution {
  int maxEqualRowsAfterFlips(List<List<int>> matrix) {
    Map<String, int> map = {};

    for (var row in matrix) {
      List<String> pattern = [];

      for (int i = 0; i < row.length; i++) {
        // normalize relative to first element
        pattern.add((row[i] ^ row[0]).toString());
      }

      String key = pattern.join();

      map[key] = (map[key] ?? 0) + 1;
    }

    int ans = 0;
    for (var val in map.values) {
      if (val > ans) ans = val;
    }

    return ans;
  }
}