class Solution {
  int numberOfBoomerangs(List<List<int>> points) {
    int n = points.length;
    int total = 0;

    for (int i = 0; i < n; i++) {
      Map<int, int> map = {};

      for (int j = 0; j < n; j++) {
        if (i == j) continue;

        int dx = points[i][0] - points[j][0];
        int dy = points[i][1] - points[j][1];

        int dist = dx * dx + dy * dy;

        map[dist] = (map[dist] ?? 0) + 1;
      }

      for (int count in map.values) {
        total += count * (count - 1);
      }
    }

    return total;
  }
}