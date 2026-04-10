class Solution {
  int largestOverlap(List<List<int>> img1, List<List<int>> img2) {
    int n = img1.length;

    List<List<int>> a = [];
    List<List<int>> b = [];

    // collect 1s positions
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (img1[i][j] == 1) a.add([i, j]);
        if (img2[i][j] == 1) b.add([i, j]);
      }
    }

    Map<String, int> map = {};
    int ans = 0;

    for (var p1 in a) {
      for (var p2 in b) {
        int dx = p1[0] - p2[0];
        int dy = p1[1] - p2[1];

        String key = "$dx,$dy";
        map[key] = (map[key] ?? 0) + 1;

        if (map[key]! > ans) {
          ans = map[key]!;
        }
      }
    }

    return ans;
  }
}